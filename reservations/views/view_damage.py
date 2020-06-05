from django.shortcuts import render
from ..models import Damage, Room


def damagesList(request):
	obj = Damage.objects.all()
	return render(request, 'damages.html', { 'damages': obj, 'e_r_text': 'No Room with Damages.' })

def viewDamage(self):
	pass


def editDamage(self):
	pass


def deleteDamage(self):
	pass