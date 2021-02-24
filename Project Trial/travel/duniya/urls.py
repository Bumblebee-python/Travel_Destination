from django.contrib import admin
from django.urls import path
from duniya import views

urlpatterns = [
    path("", views.index, name= 'home'),
    path("booknow", views.booknow, name= 'booknow'),
   # path("services", views.services, name= 'services'),
   # path("contact", views.contact, name= 'contact'),
]
 