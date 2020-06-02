from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from ..models import Room
from ..forms import RoomForm

def roomsList(request):
	rooms = Room.objects.all()
	return render(request, 'rooms.html', { 'rooms': rooms})


@login_required
def createRoom(request):
	form = RoomForm(request.POST or None)

	if form.is_valid():
		obj = form.save(commit=False)
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = RoomForm()
		return redirect('rooms')

	return render(request, 'room_forms.html', { 'form': form })


def viewRoom(request, pk):
	room = get_object_or_404(Room, pk=pk)
	return render(request, 'room_single.html', { 'room': room })


@login_required
def editRoom(request, pk):
	obj = get_object_or_404(Room, pk=pk)
	form = RoomForm(request.POST or None, instance=obj)

	if form.is_valid():
		obj = form.save(commit=False)
		obj.created_by = request.user
		obj.updated_by = request.user
		obj.save()
		form = RoomForm()
		return redirect('rooms')

	return render(request, 'room_forms.html', { 'form': form })

@login_required
def deleteRoom(request, pk):
	obj = get_object_or_404(Room, pk=pk)
	if request.POST:
		obj.delete()
		return redirect('rooms')

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