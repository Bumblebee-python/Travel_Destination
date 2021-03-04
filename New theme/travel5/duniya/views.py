from django.shortcuts import render, HttpResponse

# Create your views here.
def main(request):
    return render(request, 'main.html')

def index(request):
    return render(request, 'index.html')

def contact(request):
    return render(request, 'contact.html')

def about(request):
    return render(request, 'about.html')

def all_package(request):
    return render(request, 'all-package.html')

def family_package(request):
    return render(request, 'family-package.html')

def custom_package(request):
    return render(request, 'custom-package.html')

def booking_all(request):
    return render(request, 'booking-all.html')

def booking_hotel(request):
    return render(request, 'booking-hotel.html')

def booking_agency(request):
    return render(request, 'booking-agency.html')

def booking_tour_package(request):
    return render(request, 'booking-tour-package.html')

def honeymoon_package(request):
    return render(request, 'honeymoon-package.html')

def dashboard(request):
    return render(request, 'dashboard.html')

def forgot_pass(request):
    return render(request, 'forgot-pass.html')

def login(request):
    return render(request, 'login.html')

def register(request):
    return render(request, 'register.html')

def weekend_package(request):
    return render(request, 'weekend-package.html')

def tour_detail(request):
    return render(request, 'tour-details.html')

def tips(request):
    return render(request, 'tips.html')

def regular_package(request):
    return render(request, 'regular-package.html')

def hotel_details(request):
    return render(request, 'hotel-details.html')

def hotel_list(request):
    return render(request, 'hotel-list.html')

def price_list(request):
    return render(request, 'price-list.html')

def booking_slider(request):
    return render(request, 'booking-slider.html')

def booking(request):
    return render(request, 'booking.html')

def testimonials(request):
    return render(request,'testimonial.html')

def sitemap(request):
    return render(request,'sitemap.html')

def places(request):
    return render(request,'places.html')

def group_package(request):
    return render(request,'group-package.html')

def faq(request):
    return render(request,'faq.html')

def events(request):
    return render(request,'events.html')

def blog(request):
    return render(request,'blog.html')

def blog_inner(request):
    return render(request,'blog-inner.html')

def discount(request):
    return render(request,'discount.html')

def 404(request):
    return render(request,'404.html')

def db_all_payment(request):
    return render(request,'db_all_payment.html')

def db_event_booking(request):
    return render(request,'db_event_booking.html')

def db_event_details(request):
    return render(request,'db_event_details.html')

def db_hotel_booking(request):
    return render(request,'db_hotel_booking.html')

def db_hotel_details(request):
    return render(request,'db_hotel_details.html')

def db_my_profile_edit(request):
    return render(request,'db_my_profile_edit.html')

def db_my_profile(request):
    return render(request,'db_my_profile.html')

def db_payment(request):
    return render(request,'db_payment.html')

def db_refund(request):
    return render(request,'db_refund.html')


def db_travel_booking(request):
    return render(request,'db_travel_booking.html')

def db_travel_details(request):
    return render(request,'db_travel_details.html')


