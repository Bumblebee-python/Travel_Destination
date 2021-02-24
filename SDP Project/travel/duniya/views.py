from django.shortcuts import render, HttpResponse

# Create your views here.
def index(request):
    return render(request, 'master.html')

def booknow(request):
      return render(request, 'booknow.html')

#def services(request):
   # return render(request, 'services.html')

#def contact(request):
   # return render(request, 'contact.html')