from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return render(request, 'master.html')

def booknow(request):
      return render(request, 'booknow.html')

def about(request):
    return render(request, 'about.html')

def contact(request):
   return render(request, 'contact.html')

def signin(request):
   return render(request, 'signin.html')

    #def services(request):
   # return render(request, 'services.html')