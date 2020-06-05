from django.conf import settings
from django.db import models


# SINGLE = 'Single'
# DOUBLE = 'Double'
# DELUXE = 'Deluxe'
# SUITE = 'Suite'

# class RoomType(models.Model):
# 	category = models.CharField(max_length=191, choices=ROOM_TYPE_CHOICES)
# 	name = models.CharField('type',max_length=191, unique=True)
# 	description = models.TextField(blank=True)
# 	price = models.CharField(max_length=10)
# 	created_by = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, null=True, on_delete=models.SET_NULL, related_name='room_types')
# 	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, null=True, on_delete=models.SET_NULL, related_name='+')
# 	created_at = models.DateTimeField(auto_now=True)
# 	updated_at = models.DateTimeField(auto_now_add=True)

# 	class Meta:
# 		db_table = 'hotel_room_types'
# 		verbose_name = 'Room Type'
# 		verbose_name_plural = 'Room Types'
# 		ordering = ['-updated_at']


# 	def __str__(self):
# 		return f"{self.category} -- {self.name}"

class RoomQuerySet(models.QuerySet):
	def booked(self):
		return self.filter(is_booked=True)


	def notBooked(self):
		return self.filter(is_booked=False)


	def hasDamages(self):
		return self.filter(has_damages=True)


class RoomManager(models.Manager):
	def get_queryset(self):
		return RoomQuerySet(self.model, using=self._db)


	def booked(self):
		return self.get_queryset().booked()


	def notBooked(self):
		return self.get_queryset().notBooked()


	def hasDamages(self):
		return self.get_queryset().hasDamages()


ROOM_TYPE_CHOICES = (
	('Single', 'Single'),
	('Double', 'Double'),
	('Deluxe', 'Deluxe'),
	('Suite', 'Suite'),
)
ROOM_STATUS_CHOICES = (
	('repair', 'Under Repair'),
	('cleaning', 'Cleaning'),
	('closed', 'Closed'),
	('active', 'Active'),
	('missing_materials', 'Missing Materials')
)
class Room(models.Model):
	room_number = models.CharField(unique=True, max_length=50)
	room_type = models.CharField(max_length=191, choices=ROOM_TYPE_CHOICES)
	# room_type = models.ForeignKey(RoomType, null=True, on_delete=models.SET_NULL, related_name='rooms')
	price = models.CharField(max_length=10)
	status = models.CharField(max_length=20, default='active', choices=ROOM_STATUS_CHOICES)
	is_booked = models.BooleanField(default=False)
	has_damages = models.BooleanField(default=False)
	description = models.TextField(blank=True)
	created_by = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, null=True, on_delete=models.CASCADE, related_name='rooms')
	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, default=1, null=True, on_delete=models.CASCADE, related_name='+')
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)


	objects = RoomManager()

	class Meta:
		db_table = 'hotel_rooms'
		ordering = ['room_number']

		
	def __str__(self):
		return f"Room {self.room_number} - {self.room_type}"