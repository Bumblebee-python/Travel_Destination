from django.shortcuts import render, HttpResponse
from datetime import datetime
from home.models import contact
# Create your views here.
def index(request):
    context = {
        "variable":"this is sent"
    }
    return render(request, 'index.html', context )
   # return HttpResponse("this is homepage")  

def about(request):
    return render(request, 'about.html', )
    #return HttpResponse("this is about page") 

def services(request):
    return render(request, 'services.html',  )
    #return HttpResponse("this is services page") 

def contact(request):
    if request.method == "POST":
        name = request.POST.get('name')
        email = request.POST.get('email')
        contact = request.POST.get('contact')
        desc = request.POST.get('desc')
        contact = contact (name=name, email=email, contact=contact, desc=desc, date=datetime.today())
        contact.save()

    return render(request, 'contact.html'  )
    #return HttpResponse("this is contact page") 

