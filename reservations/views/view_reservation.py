import csv

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.utils.crypto import get_random_string
from ..models import Reservation, Room, Customer
from ..forms import ReservationForm, UpdateReservationForm, CustomerForm
from django.contrib import messages
from django.http import HttpResponse, HttpResponseNotFound
from django.contrib.auth.models import User


@login_required
def index(request):
    return redirect('dashboard')
        

@login_required
def dashboard(request):
    return render(request, 'dashboard.html')


@login_required
def reservationsList(request):
	obj = Reservation.objects.select_related('room', 'customer')
	# queryset = Reservation.objects.all().order_by('-created_at')
	paginator = Paginator(obj, 4)

	page_number = request.GET.get('page', 1)

	
	try:
		reservations = paginator.get_page(page_number)
	except PageNotAnInteger:
	# 	# fallback to first page
		reservations = paginator.get_page(1)
	except EmptyPage:
	# 	# probably the user tried to add a page number
	# 	# in the url, so we fallback to the last page
		reservations = paginator.get_page(paginator.num_pages)
	# print(reservations.object_list)
	return render(request, 'reservations.html', { 'reservations': obj })


@login_required
def activeReservation(request):
	obj = Reservation.objects.select_related('room', 'customer').active()
	return render(request, 'reservations.html', { 'reservations': obj })


@login_required
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


def view_pdf(request):
	fs = FileSystemStorage()
	filename = 'business-by-the-book.pdf'
	if fs.exists(filename):
		with fs.open(filename) as pdf:
			response = HttpResponse(pdf, content_type='application/pdf')
			# response['Content-Disposition'] = 'attachment; filename="business-by-the-book.pdf"'
			response['Content-Disposition'] = 'inline; filename="business-by-the-book.pdf"'
			return response
	else:
		return HttpResponseNotFound('The file was not found.')


def export_users_to_csv(request):
	response = HttpResponse(content_type='text/csv')
	response['Content-Disposition'] = 'attachment; filename="users.csv'

	writer = csv.writer(response)
	writer.writerow(['username', 'first name', 'last name', 'email address'])

	users = User.objects.all().values_list('username', 'last_name', 'first_name', 'email')
	for user in users:
		writer.writerow(user)

	return response


def export_to_csv(request):
	response = HttpResponse(content_type='text/csv')
	response['Content-Disposition'] = 'attachment; filename="hotel reservations.csv"'

	writer = csv.writer(response)
	writer.writerow(['Customer', 'Room Booked', 'No. of Nights', 'Check-in date', 'Check-out date', 'is-active', 'Amount Paid', 'Payment Mode', 'Date Created'])

	obj = Reservation.objects.all()
	# values_list('customer','room','nights','check_in','check_out','is_active','created_at')
	reservations = obj.select_related('customer', 'room')

	for res in reservations:
		writer.writerow([res.customer, res.room, res.nights, res.check_in, res.check_out, res.is_active, res.created_at])

	return response