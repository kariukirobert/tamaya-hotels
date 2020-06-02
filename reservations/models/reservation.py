from django.conf import settings
from django.db import models
# from .room import RoomType
from .room import Room
from .customer import Customer


PAYMENT_CHOICES = (
	('cash', 'Cash'),
	('mpesa', 'M-pesa'),
	('card', 'Card'),
)
class Reservation(models.Model):
	code = models.CharField(unique=True, max_length=10)
	room = models.ForeignKey(Room, null=True, on_delete=models.CASCADE, related_name='reservations')
	customer = models.ForeignKey(Customer, null=True, on_delete=models.CASCADE, related_name='reservations')
	nights = models.PositiveSmallIntegerField(default=1)
	payment = models.CharField(max_length=10, choices=PAYMENT_CHOICES)
	created_by = models.ForeignKey(settings.AUTH_USER_MODEL , null=True, on_delete=models.CASCADE, related_name='reservations')
	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL , null=True, on_delete=models.CASCADE, related_name='+')
	created_at = models.DateTimeField(auto_now=True)
	updated_at = models.DateTimeField(auto_now_add=True)


	class Meta:
		db_table = 'hotel_reservations'
		ordering = ['-created_at']


	def __str__(self):
		return f"{self.customer} {self.room}"
