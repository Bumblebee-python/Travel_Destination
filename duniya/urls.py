from django.contrib import admin
from django.urls import path
from duniya import views

urlpatterns = [
   
    path("index", views.index, name= 'index'),
    path("login", views.login, name= 'login'),
    path("forgot", views.forgot, name= 'forgot'),
    path("hotel_add", views.hotel_add, name= 'hotel_add'),
    path("hotel_add_process", views.hotel_add_process, name= 'hotel_add_process'),
    path("hotel_all", views.hotel_all, name= 'hotel_all'),

    path("user_add", views.user_add, name= 'user_add'),
    path("user_all", views.user_all, name= 'user_all'),

    path("package_add", views.package_add, name= 'package_add'),
    path("package_all", views.package_all, name= 'package_all'),
    path("package_add_process", views.package_add_process, name= 'package_add_process'),

    path("agency_add", views.agency_add, name= 'agency_add'),
    path("agency_add_process", views.agency_add_process, name= 'agency_add_process'),
    path("agency_all", views.agency_all, name= 'agency_all'),

   

####################################################################

    path("", views.userhome, name= 'home'),
    path("about", views.about, name= 'about'),
    path("contact", views.contact, name= 'contact'),
    path("register", views.register, name= 'register'),
    path("login", views.login, name= 'login'),
    path("faq", views.faq, name= 'faq'),

    path("user-package-list", views.user_package_listing, name= 'user_package_listing'),
    path("user-package-list-state/<int:id>", views.user_package_listing_state, name= 'user_package_listing_state'),
    path("user-package-details/<int:id>", views.user_package_details, name= 'user_package_details'),
    path("user-package-booking", views.user_package_booking, name= 'user_package_booking'),

    
    path("user-agency-list", views.user_agency_listing, name= 'user_agency_listing'),
    path("user-agency-list-city/<int:id>", views.user_agency_listing_city, name= 'user_agency_listing_city'),

    path("user-hotel-list", views.user_hotels_listing, name= 'user_hotels_listing'),
    path("user-hotel-list-city/<int:id>", views.user_hotels_listing_city, name= 'user_hotels_listing_city'),
    path("user-hotel-room-list/<int:id>", views.user_hotels_room_listing, name= 'user_hotels_room_listing'),
    path("user-hotel-booking/<int:id>", views.user_hotel_booking, name= 'user_hotel_booking'),
    path("thanks", views.thanks, name= 'thanks'),



    path("custom_package", views.custom_package, name= 'custom-package'),
    path("booking_all", views.booking_all, name= 'booking-all'),
    path("booking_hotel", views.booking_hotel, name= 'booking-hotel'),
    path("booking_agency", views.booking_agency, name= 'booking_agency'),
    path("booking_tour_package", views.booking_tour_package, name= 'booking_tour_package'),
   
    path("dashboard", views.dashboard, name= 'dashboard'),
   
    
   
    path("tour_detail", views.tour_detail, name= 'tour_detail'),
    path("tips", views.tips, name= 'tips'),
    
    path("hotel_details", views.hotel_details, name= 'hotel_details'),
    


    path("price_list", views.price_list, name= 'price_list'),
    path("booking_slider", views.booking_slider, name= 'booking_slider'),
    path("booking", views.booking, name= 'booking'),
    path("testimonials", views.testimonials, name= 'testimonials'),
    path("sitemap", views.sitemap, name= 'sitemap'),
    path("places", views.places, name= 'places'),
    
    
    path("events", views.events, name= 'events'),
    path("blog", views.blog, name= 'blog'),
    path("blog_inner", views.blog_inner, name= 'blog_inner'),
    path("discount", views.discount, name= 'discount'),

    

   
]
 