from django.contrib import admin
from django.urls import path
from duniya import views

urlpatterns = [
    path("", views.main, name= 'home'),
    path("about", views.about, name= 'about'),
    path("all_package", views.all_package, name= 'all-package'),
    path("family_package", views.family_package, name= 'family-package'),
    path("custom_package", views.custom_package, name= 'custom-package'),
    path("booking_all", views.booking_all, name= 'booking-all'),
    path("booking_hotel", views.booking_hotel, name= 'booking-hotel'),
    path("weekend_package", views.weekend_package, name= 'weekend-package'),
    path("tour_details", views.tour_detail, name= 'tour-details'),
    path("hotel_list", views.hotel_list, name= 'hotel-list'),

   
]
 