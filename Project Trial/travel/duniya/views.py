from django.shortcuts import render, HttpResponse

# Create your views here.
def index(request):
    return render(request, 'master.html')

def booknow(request):
      return render(request, 'booknow.html')

def about(request):
    return render(request, 'about.html')

def contact(request):
   return render(request, 'contact.html')

def signlog(request):
   return render(request, 'signlog.html')

    #def services(request):
   # return render(request, 'services.html')