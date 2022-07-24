from django.shortcuts import render,redirect
from django.shortcuts import render, HttpResponse
from django.core.mail import send_mail
from django.conf import settings

from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.conf.urls.static import static
from django.core.mail import send_mail
from django.conf import settings

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='travel_db')
print('Successfully connected to database')
cur = conn.cursor()



def index(request):
    return render(request, 'admin/index.html ')


def login(request):
    if request.method == 'POST':
        print(request.POST)
        user_email = request.POST['txt1']
        user_password = request.POST['txt2']
        cur.execute("select * from `tbl_user_mst` where `user_email` = '{}' and `admin_pass` = '{}'".format(user_email,user_password))
        data = cur.fetchone()
        
        if data is not None:

            if len(data) > 0:
                #Fetch Data
                admin_db_id = data[0]
                admin_db_email = data[1]
                print(admin_db_id)
                print(admin_db_email)
                #Session Create Code
                request.session['admin_id'] = admin_db_id
                request.session['admin_email'] = admin_db_email
                #Session Create Code
                #Cookie Code
                response = redirect(dashboard)
                response.set_cookie('admin_id', admin_db_id)
                response.set_cookie('admin_email', admin_db_email)
                return response
                #Cookie Code
            else:
                return render(request, 'admin/login.html') 
        return render(request, 'admin/login.html')
        
       # return redirect(dashboard) 
    else:
        return render(request, 'admin/login.html') 


def dashboard(request):
    if 'admin_email' in request.COOKIES and request.session.has_key('admin_email'):
        
        admin_emails = request.session['admin_email']
        admin_emailc = request.COOKIES['admin_email']

        print("Session is  " + admin_emails)
        print("Cookie is  " + admin_emailc)

        return render(request, 'dashboard.html')
    else:
        return redirect(login)

def forgot(request):
    return render(request, 'forgot.html ')

def logout(request):
    del request.session['admin_id']
    del request.session['admin_email']
    response = redirect(login)
    response.delete_cookie('admin_id')
    response.delete_cookie('admin_email')
    return response

#Hotel DataFetch
def hotel_all(request):
    cur.execute("SELECT * FROM `tbl_hotel_mst`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'admin/hotel-all.html', {'mydata': data})  
    
#Hotel Add
def hotel_add(request):
    return render(request, 'admin/hotel-add.html ')

#Hotel Add Process
def hotel_add_process(request):
    if request.method == 'POST':
        print(request.POST)
        hotel_id = request.POST['txt1']
        hotel_name = request.POST['txt2']
        hotel_password = request.POST['txt3']
        hotel_price = request.POST['txt4']
        hotel_email = request.POST['txt5']
        hotel_contact = request.POST['txt6']
        hotel_address = request.POST['txt7']
        hotel_rooms_avail = request.POST['txt8']
        state_id = request.POST['txt9']
        city_id = request.POST['txt10']

        cur.execute("INSERT INTO `tbl_hotel_mst`(`hotel_id`,`hotel_name`,`hotel_password`,`hotel_price`,`hotel_email`,`hotel_contact`,`hotel_address`,`hotel_rooms_avail`,`state_id`,`city_id`) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(hotel_id,hotel_name,hotel_password,hotel_price,hotel_email,hotel_contact,hotel_address,hotel_rooms_avail,state_id,city_id))
        conn.commit()
        return redirect(hotel_all) 
    else:
        return redirect(hotel_all)
def hotel_delete(request,id):
     
    #id = request.GET['id']
    #id = User.objects.get(id=id)
    print(id)
    cur.execute("delete from `hotel_mst_category` where `hotel_id` = {}".format(id))
    conn.commit()
    return redirect(hotel_all) 







def agency_add(request):
    return render(request, 'agency-add.html ')
    
#Agency DataFetch
def agency_all(request):
    cur.execute("SELECT * FROM `tbl_agency_mst`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'agency-all.html', {'mydata': data})   
    

#Agency Add Process
def agency_add_process(request):
    if request.method == 'POST':
        print(request.POST)
        agency_id = request.POST['txt1']
        agency_name = request.POST['txt2']
        agency_password = request.POST['txt3']
        agency_price = request.POST['txt4']
        agency_email = request.POST['txt5']
        agency_contact = request.POST['txt6']
        agency_address = request.POST['txt7']
        agency_guides = request.POST['txt8']
        agency_guides_avail = request.POST['txt9']
        state_id = request.POST['txt10']
        city_id = request.POST['txt11']

        cur.execute("INSERT INTO `tbl_hotel_mst`(`agency_id`,`agency_name`,`agency_password`,`agency_price`,`agency_email`,`agency_contact`,`agency_address`,`agency_guides`,`agency_guides_avail`,`state_id`,`city_id`) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}', '{}')".format(agency_id,agency_name,agency_password,agency_price,agency_email,agency_contact,agency_address, agency_guides,agency_guides_avail,state_id,city_id))
        conn.commit()
        return redirect(hotel_all) 
    else:
        return redirect(hotel_all)

#User Add
def user_add(request):
    return render(request,'admin/user-add.html ')

#User DataFetch
def user_all(request):
    cur.execute("SELECT * FROM `tbl_user_mst`")
    data = cur.fetchall()
    #return list(data)
    print(list(data))
    return render(request, 'admin/user-all.html', {'mydata': data})   
    
#Package Add
def package_add(request):
    return render(request,'admin/package-add.html ')

#User Add Process
def package_add_process(request):
    if request.method == 'POST':
        print(request.POST)
        package_id = request.POST['package_id']
        package_price = request.POST['package_price']
        hotel_name = request.POST['hotel_name']
        agency_name = request.POST['agency_name']
        cur.execute("INSERT INTO `tbl_package_mst`(`package_id`,`package_price`,`hotel_name`, `agency_name`) VALUES ('{}','{}','{}','{}')".format(package_id,package_price,hotel_name,agency_name))
        conn.commit()
        return redirect(package_all) 
    else:
        return redirect(package_all)

#package DataFetch
def package_all(request):
    cur.execute("SELECT * FROM `tbl_package_mst`")
    data = cur.fetchall()
    return list(data)
  # print(list(data))
    return render(request, 'admin/package-all.html', {'mydata': data})   
    

 







#######################################################################





# Create your views here.
def userhome(request):
    return render(request, 'user/main.html')

def about(request):
    return render(request, 'user/about.html')

def contact(request):
    return render(request, 'user/contact.html')




def user_package_listing(request):
    cur.execute("SELECT * FROM `tbl_package_mst`")
    data = cur.fetchall()
    cur.execute("select * from tbl_state")
    data1 = cur.fetchall()
    return render(request, 'user/user-package-listing.html', {'mydata': data,'citydata': data1})

def user_package_listing_state(request,id):
    cur.execute("SELECT * FROM `tbl_package_mst` where `state_id`  = {}".format(id))
    data = cur.fetchall()
    cur.execute("select * from tbl_state")
    data1 = cur.fetchall()
    return render(request, 'user/user-package-listing.html', {'mydata': data,'citydata': data1})


def user_package_details(request,id):
    cur.execute('''SELECT
    `tbl_package_mst`.`package_id`
    , `tbl_package_mst`.`packgae_name`
    , `tbl_package_mst`.`pacakge_price`
    , `tbl_package_mst`.`packgae_details`
    , `tbl_package_mst`.`packgae_image`
    , `tbl_agency_mst`.`agency_name`
    , `tbl_agency_mst`.`agency_contact`
    , `tbl_state`.`state_name`
FROM
    `tbl_package_mst`
    INNER JOIN `tbl_agency_mst` 
        ON (`tbl_package_mst`.`agency_id` = `tbl_agency_mst`.`agency_id`)
    INNER JOIN `tbl_state` 
        ON (`tbl_agency_mst`.`state_id` = `tbl_state`.`state_id`) WHERE `tbl_package_mst`.`package_id` = {}'''.format(id))
    data = cur.fetchone()
    cur.execute("select * from tbl_state")
    data1 = cur.fetchall()
    return render(request, 'user/user-package-details.html', {'mydata': data,'citydata': data1})

def user_package_booking(request):
    if request.method == 'POST':
        print(request.POST)
        userid = 1
        txt0 = request.POST['txt0']
        txt1 = request.POST['txt1']
        txt2 = request.POST['txt2']
        txt3 = request.POST['txt3']
        txt4 = request.POST['txt4']
        txt5 = request.POST['txt5']
        cur.execute("INSERT INTO `tbl_package_booking`(`package_id`,`user_id`,`booking_name`,`booking_mobile`,`booking_address`,`no_person`,`travel_date`) VALUES ('{}','{}','{}','{}','{}','{}','{}')".format(txt0,userid,txt1,txt2,txt3,txt4,txt5))
        conn.commit()
        return redirect(thanks) 
    else:
        return render(request,'user/user-package-list')


def user_agency_listing(request):
    cur.execute("SELECT * FROM `tbl_agency_mst`")
    data = cur.fetchall()
    cur.execute("select * from tbl_city")
    data1 = cur.fetchall()
    return render(request, 'user/user-agency-listing.html', {'mydata': data,'citydata': data1})


def user_agency_listing_city(request,id):
    cur.execute("SELECT * FROM `tbl_agency_mst` where `city_id`  = {}".format(id))
    data = cur.fetchall()
    cur.execute("select * from tbl_city")
    data1 = cur.fetchall()
    return render(request, 'user/user-agency-listing.html', {'mydata': data,'citydata': data1})



def user_hotels_listing(request):
    cur.execute('''SELECT
    `tbl_hotel_mst`.*
    , `tbl_city`.`city_name`
FROM
    `tbl_hotel_mst`
    INNER JOIN `tbl_city` 
        ON (`tbl_hotel_mst`.`city_id` = `tbl_city`.`city_id`);''')
    data = cur.fetchall()
    cur.execute("select * from tbl_city")
    data1 = cur.fetchall()
    return render(request, 'user/user-hotels-listing.html', {'mydata': data,'citydata': data1})

def user_hotels_listing_city(request,id):
    cur.execute('''SELECT
    `tbl_hotel_mst`.*
    , `tbl_city`.`city_name`
FROM
    `tbl_hotel_mst`
    INNER JOIN `tbl_city` 
        ON (`tbl_hotel_mst`.`city_id` = `tbl_city`.`city_id`) where `tbl_hotel_mst`.`city_id` = {}'''.format(id))
    data = cur.fetchall()
    cur.execute("select * from tbl_city")
    data1 = cur.fetchall()
    return render(request, 'user/user-hotels-listing.html', {'mydata': data,'citydata': data1})

def user_hotels_room_listing(request,id):
    cur.execute('''SELECT
    `tbl_rooms`.`room_id`
    , `tbl_rooms`.`room_type`
    , `tbl_rooms`.`room_img`
    , `tbl_rooms`.`room_price`
    , `tbl_hotel_mst`.`hotel_name`
    , `tbl_hotel_mst`.`hotel_contact`
FROM
    `tbl_hotel_mst`
    INNER JOIN `tbl_rooms` 
        ON (`tbl_hotel_mst`.`hotel_id` = `tbl_rooms`.`hotel_id`) WHERE `tbl_rooms`.`hotel_id` = {}'''.format(id))
    data = cur.fetchall()
    cur.execute("select * from tbl_city")
    data1 = cur.fetchall()
    return render(request, 'user/user-hotels-room-listing.html', {'mydata': data,'citydata': data1})
    
def user_hotel_booking(request,id):
    if request.method == 'POST':
        print(request.POST)
        txt6 = request.POST['txt0']
        txt1 = request.POST['txt1']
        txt2 = request.POST['txt2']
        txt3 = request.POST['txt3']
        txt4 = request.POST['txt4']
        txt5 = request.POST['txt5']
        cur.execute("INSERT INTO `tbl_hotel_booking`(`booking_name`,`booking_mobile`,`no_person`,`checkin_date`,`checkin_time`,`room_id`) VALUES ('{}','{}','{}','{}','{}','{}')".format(txt1,txt2,txt3,txt4,txt5,txt6))
        conn.commit()
        return redirect(thanks) 
    else:
        return render(request,'user/user-hotel-booking.html',{'myid':id})

def thanks(request):
    return render(request, 'user/thanks.html')

def index1(request):
    return render(request, 'index.html')


def booking_tour_package(request):
    return render(request, 'booking-tour-package.html')

def custom_package(request):
    return render(request, 'custom-package.html')

def booking_all(request):
    return render(request, 'booking-all.html')

def booking_hotel(request):
    return render(request, 'booking-hotel.html')

def booking_agency(request):
    return render(request, 'booking-agency.html')




def dashboard1(request):
    return render(request, 'dashboard.html')

def forgot_pass1(request):
    return render(request, 'forgot-pass.html')

def login1(request):
    return render(request, 'login.html')

def register(request):
    return render(request, 'user/register.html')



def tour_detail(request):
    return render(request, 'tour-details.html')

def tips(request):
    return render(request, 'tips.html')



def hotel_details(request):
    return render(request, 'hotel-details.html')


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

def page_not_found(request):
    return render(request,'404.html')

def db_all_payment(request):
    return render(request,'db-all-payment.html')

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




def login11(request):
    if request.method == 'POST':
        print(request.POST)
        admin_email = request.POST['txt1']
        admin_pass = request.POST['txt2']
        cur.execute("select * from `tb_admin` where `admin_email` = '{}' and `admin_pass` = '{}'".format(admin_email,admin_pass))
        data = cur.fetchone()
        
        if data is not None:

            if len(data) > 0:
                #Fetch Data
                admin_db_id = data[0]
                admin_db_email = data[1]
                print(admin_db_id)
                print(admin_db_email)
                #Session Create Code
                request.session['admin_id'] = admin_db_id
                request.session['admin_email'] = admin_db_email
                #Session Create Code
                #Cookie Code
                response = redirect(dashboard)
                response.set_cookie('admin_id', admin_db_id)
                response.set_cookie('admin_email', admin_db_email)
                return response
                #Cookie Code
            else:
                return render(request, 'login.html') 
        return render(request, 'login.html')
        
       # return redirect(dashboard) 
    else:
        return render(request, 'login.html') 


def dashboard11(request):
    if 'admin_email' in request.COOKIES and request.session.has_key('admin_email'):
        
        admin_emails = request.session['admin_email']
        admin_emailc = request.COOKIES['admin_email']

        print("Session is  " + admin_emails)
        print("Cookie is  " + admin_emailc)

        return render(request, 'dashboard.html')
    else:
        return redirect(login)

def logout11(request):
    
    del request.session['admin_id']
    del request.session['admin_email']
    response = redirect(login)
    response.delete_cookie('admin_id')
    response.delete_cookie('admin_email')
    return response


def email(request):
    subject = 'Thank you for registering to our site'
    message = ' it  means a world to us '
    email_from = settings.EMAIL_HOST_USER
    recipient_list = ['receiver@gmail.com',]
    send_mail( subject, message, email_from, recipient_list )
    return redirect('redirect to a new page')







 

def home(request):
    return  render(request,'admin/home.html')


def changepassword(request):
    return  render(request,'admin/account/change-password.html')

def changepasswordprocess(request):
    if 'admin_email' in request.COOKIES and request.session.has_key('admin_email'):
        print(request.POST)
        admin_id = request.session['admin_id']
        opass = request.POST['txt1']
        npass = request.POST['txt2']
        cpass = request.POST['txt3']
        cur.execute("select * from `tbl_admin` where `admin_id` = {}".format(admin_id))
        db_data = cur.fetchone()

        if db_data is not None:

            if len(db_data) > 0:
                #Fetch Data
                oldpassword = db_data[2]
                if opass == oldpassword:
                    cur.execute("update  `tbl_admin` set `admin_password` = {} where `admin_id` = {}".format(npass,admin_id))
                    conn.commit()
                    messages.success(request, 'Password Changed')
                    return render(request, 'admin/account/change-password.html')
                else:
                    messages.success(request, 'Wrong Old Password ')
                    return render(request, 'admin/account/change-password.html')
            else:
                redirect(login) 
        else: 
            redirect(login) 
    else:
        return redirect(login)   
          
           
        

def logout111(request):
    
    del request.session['admin_id']
    del request.session['admin_email']
    response = redirect(login)
    response.delete_cookie('admin_id')
    response.delete_cookie('admin_email')
    return response        


def forgotpassword(request):
    return  render(request,'admin/account/forgot-password.html')
    
def forgotpasswordprocess(request):
    print(request.POST)
    admin_email = request.POST['txt1']
    cur.execute("select * from `tbl_admin` where `admin_email` = '{}' ".format(admin_email))
    db_data = cur.fetchone()
        
    if db_data is not None:
        if len(db_data) > 0:
            #Fetch Data
            admin_db_id = db_data[0]
            admin_db_email = db_data[1]
            admin_db_password = db_data[2]
            print(admin_db_id)
            print(admin_db_email)
            
            subject = 'Forgot Password'
            message = ' Your Password is  ' + admin_db_password
            email_from = settings.EMAIL_HOST_USER
            recipient_list = [admin_db_email,]
            send_mail( subject, message, email_from, recipient_list )
            messages.success(request, 'Password Sent on Email ID')
            return redirect(login)
            #Cookie Code
        else:
            messages.success(request, 'Wrong Email Details')
            return render(request, 'admin/account/forgot-password.html') 
    messages.success(request, 'Wrong Email Details')
    return render(request, 'admin/account/forgot-password.html')
 