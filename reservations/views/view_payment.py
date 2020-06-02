from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from ..models import Reservation
from ..forms import RoomForm


def paymentList(request):
	reservations = Reservation.objects.all()
	obj = reservations.select_related('room', 'customer')
	# reservations = Reservation.objects.annotate(sum_total=sum('price'))
	# print(reservations)
	return render(request, 'payments.html', { 'reservations': obj })


def createPayment(request):
	pass


def updatePayment(request):
	pass


def deletePayment(request):
	pass


