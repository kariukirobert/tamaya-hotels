from django import forms
from datetime import datetime
# from datetime import datetime, timedelta, time
# from django.utils.dateformat import datetime
from django.utils import timezone
from django.utils.dateformat import format
from .models import Reservation, Room, Customer


class ReservationForm(forms.ModelForm):
	name = forms.CharField(max_length=50)
	phone_number = forms.CharField(max_length=20)
	id_number = forms.CharField(max_length=10, widget=forms.TextInput(attrs={
			'placeholder': 'Customer Id Number'
		}))
	check_in = forms.DateField(widget=forms.DateInput(attrs={
			'type': 'date'
		}))
	check_out = forms.DateField(widget=forms.DateInput(attrs={
			'type': 'date'
		}))


	class Meta:
		model = Reservation
		fields = ('name', 'phone_number', 'id_number', 'room', 'nights', 'payment', 'check_in', 'check_out')
		labels = {
			'name': "Customer Name",
			'phone_number': "Phone Number",
			'check_in': 'Check In'
		}

	# def clean_room(self, *args, **kwargs):
	# 	instance = self.instance
	# 	room = self.cleaned_data.get('room')
	# 	qs = Room.objects.filter(pk=room.id, is_booked=True)
	# 	if instance is not None:
	# 		qs = qs.exclude(pk=instance.pk)
	# 	if qs.exists():
	# 		raise forms.ValidationError("This room is already booked!!!!")

	# 	return room


	# def clean_check_in(self):
	# 	instance = self.instance
	# 	check_in = self.cleaned_data.get('check_in')
	# 	# formatted_date = format(timezone.now(), 'Y-m-d')
	# 	now = datetime.now().date()
	# 	now = datetime.date.today()
	# 	now = datetime.today()
	# 	# tomorrow = today + timedelta(1)
	# 	# today_end = datetime.combine(tomorrow, time())
	# 	# if format(check_in, 'Y-m-d') < formatted_date:
	# 	if check_in < now:
	# 		raise forms.ValidationError("Check in date must be today or greater than today")

	# 	return check_in


	def clean(self):
		instance = self.instance
		cleaned_data = super().clean()
		if cleaned_data.get('room') is not None:
			room = cleaned_data.get('room')
			qs = Room.objects.filter(pk=room.id, is_booked=True)
			if qs.exists():
				msg = u"This room is already booked!!!!"
				self._errors['room'] = self.error_class([msg])

		if cleaned_data.get('check_in') and cleaned_data.get('check_out') is not None:
			check_in = cleaned_data.get('check_in')
			check_out = cleaned_data.get('check_out')
			now = datetime.now().date()
			if check_in < now:
				msg = u"Check in date must be today or greater than today"
				self._errors['check_in'] = self.error_class([msg])

			if check_in >= check_out:
				msg = u"Check out date must be greater than Check in date"
				self._errors['check_out'] = self.error_class([msg])


		if cleaned_data.get('nights') < 1 or None:
			msg = u"Enter correct value of nights"
			self.errors['nights'] = self.error_class([msg])



class UpdateReservationForm(forms.ModelForm):
	class Meta:
		model = Reservation
		fields = ('room', 'nights', 'payment', 'check_in', 'check_out', 'is_active')


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