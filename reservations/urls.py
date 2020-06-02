from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='home'),
    path('staffAccount/', views.dashboard, name='dashboard'),
    path('staffAccount/dashboard/', views.dashboard, name='dashboard'),

    path('staffAccount/reservations/', views.reservationsList, name='reservations'),
    path('staffAccount/reservations/new/', views.createReservation, name='new_reservation'),
    path('staffAccount/reservations/<int:pk>/', views.viewReservation, name='view_reservation'),
    path('staffAccount/reservations/<int:pk>/edit/', views.editReservation, name='edit_reservation'),
    path('staffAccount/reservations/<int:pk>/delete/', views.deleteReservation, name='delete_reservation'),

    path('staffAccount/customers/', views.customerList, name='customers'),
    path('staffAccount/customers/new/', views.createCustomer, name='new_customer'),
    path('staffAccount/customers/<int:pk>/', views.viewCustomer, name='view_customer'),
    path('staffAccount/customers/<int:pk>/edit/', views.editCustomer, name='edit_customer'),
    path('staffAccount/customers/<int:pk>/delete/', views.deleteCustomer, name='delete_customer'),

    path('staffAccount/rooms/', views.roomsList, name='rooms'),
    path('staffAccount/rooms/new/', views.createRoom, name='new_room'),
    path('staffAccount/rooms/<int:pk>/', views.viewRoom, name='view_room'),
    path('staffAccount/rooms/<int:pk>/edit/', views.editRoom, name='edit_room'),
    path('staffAccount/rooms/<int:pk>/delete/', views.deleteRoom, name='delete_room'),

    path('staffAccount/payments/', views.paymentList, name='payments'),
    path('staffAccount/payments/new/', views.createPayment, name='new_payment'),
    path('staffAccount/payments/<int:pk>/edit/', views.updatePayment, name='edit_payment'),
    path('staffAccount/payments/<int:pk>/delete/', views.deletePayment, name='delete_payment'),
]
