from django.shortcuts import render

# Create your views here.
def home(request):
    return render(request, 'front/home.html',{"title":"Home"})

def about(request):
    return render(request, 'front/about.html',{"title":"About"})