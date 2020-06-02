from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.utils.crypto import get_random_string
from ..models import Reservation, Room, Customer
from ..forms import ReservationForm
from django.contrib import messages


def index(request):
    return redirect('dashboard')
        
        
def dashboard(request):
    return render(request, 'dashboard.html')


def reservationsList(request):
	reservations = Reservation.objects.select_related('room', 'customer')
	return render(request, 'reservations.html', { 'reservations': reservations })


def createReservation(request):
	form = ReservationForm(request.POST or None)

	if form.is_valid():
		obj = form.save(commit=False)
		customer = Customer.objects.create(name=form.cleaned_data.get('name'),
									phone=form.cleaned_data.get('phone_number'),
									id_number=form.cleaned_data.get('id_number'))
		obj.code = generateCode()
		obj.customer = customer
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = ReservationForm()
		return redirect('reservations')

	return render(request, 'reservation_forms.html', { 'form': form })


def viewReservation(request, pk):
	reservation = get_object_or_404(Reservation, pk=pk)
	return render(request, 'reservation_single.html', { 'reservation': reservation })


def editReservation(request, pk):
	obj = get_object_or_404(Reservation, pk=pk)
	form = ReservationForm(request.POST or None, instance=obj)

	if form.is_valid():
		obj = form.save(commit=False)
		customer = Customer.objects.create(name=form.cleaned_data.get('name'),
									phone=form.cleaned_data.get('phone_number'),
									id_number=form.cleaned_data.get('id_number'))
		obj.customer = customer
		obj.updated_by = request.user
		obj.save()
		form = ReservationForm()
		return redirect('reservations')

	return render(request, 'reservation_edit.html', { 'form': form, 'reservation': obj })



def deleteReservation(request, pk):
	obj = get_object_or_404(Reservation, pk=pk)
	# customer = obj.customer
	# print(customer)
	if request.POST:
		if obj.customer.reservations.count() > 1:
				obj.delete()
				return redirect('reservations')
		else:
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