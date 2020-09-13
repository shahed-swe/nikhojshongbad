from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse

# Create your views here.
import cv2,os
import shutil
import numpy as np
from PIL import Image, ImageTk
import pandas as pd
import datetime
import time
from django.conf import settings
from django.shortcuts import redirect
from .forms import InfoForm,CreateUserForm
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

def home(request):
    return render(request, 'front/home.html',{"title":"হোম"})

def about(request):
    return render(request, 'front/about.html',{"title":"সম্পর্কে"})

def new_details(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    else:
        form = InfoForm()
        return render(request, 'front/add_info.html',{"title":'নতুন তথ্য সংযোজন',"form":form})