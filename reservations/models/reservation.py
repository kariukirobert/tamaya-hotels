from django.conf import settings
from django.db import models
# from .room import RoomType
from .room import Room
from .customer import Customer


class ReservationQuerySet(models.QuerySet):
	def active(self):
		return self.filter(is_active=True)


	def closed(self):
		return self.filter(is_active=False)


class ReservationManager(models.Manager):
	def get_queryset(self):
		return ReservationQuerySet(self.model, using=self._db)


	def active(self):
		return self.get_queryset().active()


	def closed(self):
		return self.get_queryset().closed()


PAYMENT_CHOICES = (
	('cash', 'Cash'),
	('mpesa', 'M-pesa'),
	('card', 'Card'),
)
class Reservation(models.Model):
	code = models.CharField(unique=True, max_length=10)
	# room = models.ForeignKey(Room, null=True, on_delete=models.CASCADE, related_name='reservations')
	room = models.ForeignKey(Room, on_delete=models.CASCADE, related_name='reservations')
	customer = models.ForeignKey(Customer, null=True, on_delete=models.CASCADE, related_name='reservations')
	nights = models.PositiveSmallIntegerField(default=1)
	payment = models.CharField(max_length=10, choices=PAYMENT_CHOICES)
	check_in = models.DateField()
	check_out = models.DateField()
	is_active = models.BooleanField(default=True)
	created_by = models.ForeignKey(settings.AUTH_USER_MODEL , null=True, on_delete=models.CASCADE, related_name='reservations')
	created_at = models.DateTimeField(auto_now_add=True)
	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL , null=True, on_delete=models.CASCADE, related_name='+')
	updated_at = models.DateTimeField(auto_now=True)


	objects = ReservationManager()


	class Meta:
		db_table = 'hotel_reservations'
		ordering = ['-created_at']


	def __str__(self):
		return f"{self.customer} {self.room}"
