from django import forms
from .models import Reservation, Room, Customer


class ReservationForm(forms.ModelForm):
	name = forms.CharField(max_length=50)
	phone_number = forms.CharField(max_length=20)
	id_number = forms.CharField(max_length=10, widget=forms.TextInput(attrs={
			'placeholder': 'Customer Id Number'
		}))


	class Meta:
		model = Reservation
		fields = ('name', 'phone_number', 'id_number', 'room', 'nights', 'payment')


class RoomForm(forms.ModelForm):
	description = forms.CharField(widget=forms.Textarea(attrs={
			'rows': 5, 'placeholder': 'Write descriptions of the Room'
		}))
	class Meta:
		model = Room
		fields = ['room_number', 'room_type', 'description', 'price']


class CustomerForm(forms.ModelForm):
	class Meta:
		model = Customer
		fields = ('name', 'phone', 'id_number')