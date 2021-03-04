from django.contrib import admin
from django.urls import path
from duniya import views

urlpatterns = [
    path("", views.main, name= 'home'),
    path("contact", views.contact, name= 'contact'),
    path("about", views.about, name= 'about'),
    path("all_package", views.all_package, name= 'all-package'),
    path("family_package", views.family_package, name= 'family-package'),
    path("custom_package", views.custom_package, name= 'custom-package'),
    path("booking_all", views.booking_all, name= 'booking-all'),
    path("booking_hotel", views.booking_hotel, name= 'booking-hotel'),
    path("booking_agency", views.booking_agency, name= 'booking_agency'),
    path("booking_tour_package", views.booking_tour_package, name= 'booking_tour_package'),
    path("honeymoon_package", views.honeymoon_package, name= 'honeymoon_package'),
    path("dashboard", views.dashboard, name= 'dashboard'),
    path("forgot_pass", views.forgot_pass, name= 'forgot_pass'),
    path("login", views.login, name= 'login'),
    path("register", views.register, name= 'register'),
    path("weekend_package", views.weekend_package, name= 'weekend_package'),
    path("tour_detail", views.tour_detail, name= 'tour_detail'),
    path("tips", views.tips, name= 'tips'),
    path("regular_package", views.regular_package, name= 'regular_package'),
    path("hotel_details", views.hotel_details, name= 'hotel_details'),
    path("hotel_list", views.hotel_list, name= 'hotel_list'),
    path("price_list", views.price_list, name= 'price_list'),
    path("booking_slider", views.booking_slider, name= 'booking_slider'),
    path("booking", views.booking, name= 'booking'),
    path("testimonials", views.testimonials, name= 'testimonials'),
    path("sitemap", views.sitemap, name= 'sitemap'),
    path("places", views.places, name= 'places'),
    path("group_package", views.group_package, name= 'group_package'),
    path("faq", views.faq, name= 'faq'),
    path("events", views.events, name= 'events'),
    path("blog", views.blog, name= 'blog'),
    path("blog_inner", views.blog_inner, name= 'blog_inner'),
    path("discount", views.discount, name= 'discount'),

  
   
]
 