from django.contrib.auth import login as auth_login
from django.shortcuts import render, redirect

from .forms import SignUpForm


def signup(request):
	form = SignUpForm(request.POST or None)

	if form.is_valid():
		user = form.save()
		auth_login(request, user)
		form = SignUpForm()
		return	redirect('home')

	return render(request, 'signup.html', { 'form': form })


def login(request):
    return render(request, 'base_accounts.html', {'msg': "login page"})
