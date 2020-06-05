from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.utils.crypto import get_random_string
from ..models import Customer, Reservation
from ..forms import CustomerForm

def customerList(request):
	reservation = Reservation.objects.all()
	obj = reservation.select_related('customer', 'room')
	return render(request, 'customers.html', { 'reservations': obj })


def activeCustomer(request):
	reservation = Reservation.objects.active()
	obj = reservation.select_related('customer', 'room')
	return render(request, 'customers.html', { 'reservations': obj })

def closedCustomer(request):
	reservation = Reservation.objects.closed()
	obj = reservation.select_related('customer', 'room')
	return render(request, 'customers.html', { 'reservations': obj })


def createCustomer(request):
	form = CustomerForm(request.POST or None)
	if form.is_valid():
		obj = form.save(commit=False)
		obj.code = generateCode()
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = CustomerForm()
		return redirect('customers')

	return render(request, 'customer_form.html', { 'form': form })


def viewCustomer(request, pk):
	customer = get_object_or_404(Customer, pk=pk)
	return render(request, 'customer_single.html', { 'customer': customer })


def editCustomer(request, pk):
	obj = get_object_or_404(Customer, pk=pk)	
	form = CustomerForm(request.POST or None, instance=obj)
	if form.is_valid():
		obj = form.save(commit=False)
		obj.updated_by = request.user
		obj.save()
		form = CustomerForm()
		return redirect('customers')

	return render(request, 'customer_form.html', { 'form': form })


def deleteCustomer(request, pk):
	obj = get_object_or_404(Customer, pk=pk)
	if request.POST:
		obj.delete()
		return redirect('customers')

	return render(request, 'delete_confirmation.html', {})


def generateCode():
	string = '0123456789'
	random_string = get_random_string(12, string)
	res = Reservation.objects.filter(code=random_string)
	print(random_string)
	print(res)
	if res.exists():
		return generateCode()

	return random_string