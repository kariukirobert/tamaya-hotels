from django.conf import settings
from django.db import models
from .room import Room


class Damage(models.Model):
	room = models.ForeignKey(Room, on_delete=models.CASCADE, related_name='damages')
	description = models.CharField(max_length=1000, blank=True)
	is_repaired = models.BooleanField(default=False)
	created_at = models.DateTimeField(auto_now_add=True)
	created_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='+')
	updated_at = models.DateTimeField(auto_now=True)
	updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='+')


	class Meta:
		verbose_name = "Damage"
		verbose_name_plural = "Damages"
		db_table = "hotel_rooms_damages"
		ordering = ['-is_repaired', '-created_at']


	# def __str__(self):
	# 	return self.room
