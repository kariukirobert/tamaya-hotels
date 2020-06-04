#Customer Model
from django.conf import settings
from django.db import models

class Customer(models.Model):
	name = models.CharField(max_length=191)
	phone = models.CharField(max_length=191, blank=True, null=True)
	id_number = models.CharField(max_length=191, blank=True, null=True)
	is_active = models.BooleanField(default=True)
	# room = models.OneToOneField('Reservation', null=True, on_delete=models.SET_NULL, related_name='reservations')
	# room = models.ForeignKey(Room, null=True, on_delete=models.SET_NULL, related_name='customers')
	# nights = models.PositiveSmallIntegerField(default=1)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='+')
	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='+')

	class Meta:
		db_table = 'hotel_customers'
		ordering = ['-created_at']

		
	def __str__(self):
		return self.name
