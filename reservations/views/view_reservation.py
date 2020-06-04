from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.utils.crypto import get_random_string
from ..models import Reservation, Room, Customer
from ..forms import ReservationForm, UpdateReservationForm, CustomerForm
from django.contrib import messages


def index(request):
    return redirect('dashboard')
        
        
def dashboard(request):
    return render(request, 'dashboard.html')


def reservationsList(request):
	obj = Reservation.objects.select_related('room', 'customer')
	# page = request.GET.get('page', 1)
	# page = request.GET.get('page', 1)

	# paginator = Paginator(obj, 5)
	# paginator = Paginator(queryset, 20)
	
	# try:
	# 	reservations = paginator.page(page)
	# except PageNotAnInteger:
	# 	# fallback to first page
	# 	reservations = paginator.page(1)
	# except EmptyPage:
	# 	# probably the user tried to add a page number
	# 	# in the url, so we fallback to the last page
	# 	reservations = paginator.page(paginator.num_pages)

	return render(request, 'reservations.html', { 'reservations': obj })

def activeReservation(request):
	obj = Reservation.objects.select_related('room', 'customer').active()
	return render(request, 'reservations.html', { 'reservations': obj })


def closedReservation(request):
	obj = Reservation.objects.select_related('room', 'customer').closed()
	return render(request, 'reservations.html', { 'reservations': obj })


@login_required
def createReservation(request):
	form = ReservationForm(request.POST or None)
	# c_form = CustomerForm(request.POST or None)

	if form.is_valid():
		obj = form.save(commit=False)

		customer = Customer.objects.create(name=form.cleaned_data.get('name'),
									phone=form.cleaned_data.get('phone_number'),
									id_number=form.cleaned_data.get('id_number'),
									created_by=request.user,
									updated_by=request.user)
		obj.code = generateCode()
		obj.customer = customer

		# nights = form.cleaned_data.get('nights')
		# print(nights)
		# validate_nights = form.cleaned_data.get('check_out') - form.cleaned_data.get('check_in')
		# print(validate_nights)

		# if nights != validate_nights or nights < 1 or nights is None:
			# return messages.ERROR(request, "Enter correct value for nights!!!!!")

		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()

		room = form.cleaned_data.get('room')
		# room.objects.update(is_booked=True)
		room.is_booked=True
		room.save()
		# room.is_booked = True

		form = ReservationForm()
		# c_form = CustomerForm()
		return redirect('reservations')

	return render(request, 'reservation_forms.html', { 'form': form })


def viewReservation(request, pk):
	reservation = get_object_or_404(Reservation, pk=pk)
	return render(request, 'reservation_single.html', { 'reservation': reservation })


@login_required
def editReservation(request, pk):
	obj = get_object_or_404(Reservation, pk=pk)
	form = UpdateReservationForm(request.POST or None, instance=obj)

	if form.is_valid():
		obj = form.save(commit=False)
		# customer = Customer.objects.create(name=form.cleaned_data.get('name'),
									# phone=form.cleaned_data.get('phone_number'),
									# id_number=form.cleaned_data.get('id_number'))
		# obj.customer = customer
		obj.updated_by = request.user
		obj.save()

		room = obj.room
		booking_status = obj.is_active
		room.is_booked = booking_status
		room.save()

		form = UpdateReservationForm()
		return redirect('reservations')

	return render(request, 'reservation_edit.html', { 'form': form, 'reservation': obj })


@login_required
def deleteReservation(request, pk):
	obj = get_object_or_404(Reservation, pk=pk)
	# customer = obj.customer
	# print(customer)
	if request.POST:
		if obj.customer.reservations.count() > 1:
			room = obj.room
			room.is_booked=False
			room.save()
			obj.delete()
			return redirect('reservations')
		else:
			room = obj.room
			room.is_booked=False
			room.save()

			obj.delete()
			customer = Customer.objects.filter(pk=obj.customer_id)
			# messages.warning(request, 'Please correct the error below. - ')
			customer.delete()
			return redirect('reservations')		

	return render(request, 'delete_confirmation.html', {})


def generateCode():
	string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
	random_string = get_random_string(10, string)
	res = Reservation.objects.filter(code=random_string)
	print(random_string)
	print(res)
	if res.exists():
		return generateCode()

	return random_string