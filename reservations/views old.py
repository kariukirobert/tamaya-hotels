from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Reservation, Room, Customer
from .forms import ReservationForm, RoomForm


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
		obj.customer = customer
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = ReservationForm()
		return redirect('reservations')

	return render(request, 'reservation_forms.html', { 'form': form })


def editReservation(request, pk):
	obj = get_object_or_404(Reservation, pk=pk)
	form = ReservationForm(request.POST or None, instance=obj)

	if form.is_valid():
		obj = form.save(commit=False)
		customer = Customer.objects.create(name=form.cleaned_data.get('name'),
									phone=form.cleaned_data.get('phone_number'),
									id_number=form.cleaned_data.get('id_number'))
		obj.customer = customer
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = ReservationForm()
		return redirect('reservations')

	return render(request, 'reservation_forms.html', { 'form': form, 'reservation': obj })



def deleteReservation(self):
	pass


