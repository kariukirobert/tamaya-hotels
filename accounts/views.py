from django.shortcuts import render


def login(request):
    return render(request, 'base_accounts.html', {'msg': "login page"})
