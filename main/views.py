from django.shortcuts import render,get_object_or_404
from django.http import HttpResponse,JsonResponse

# Create your views here.
import cv2,os
import shutil
import numpy as np
from PIL import Image, ImageTk
import pandas as pd
import datetime
import time
import csv
from django.conf import settings
from django.shortcuts import redirect
from .forms import InfoForm,CreateUserForm,SearchForm
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import People,SearchImage

# home view
def home(request):
    return render(request, 'front/home.html',{"title":"হোম"})

# about view
def about(request):
    return render(request, 'front/about.html',{"title":"সম্পর্কে"})

# create form
def new_details(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    else:
        form = InfoForm()
        return render(request, 'front/add_info.html',{"title":'নতুন তথ্য সংযোজন',"form":form})

# person details
def person_details(request,word):
    data = People.objects.filter(p_id=word)
    return render(request, 'front/lost_person_details.html', {"title": "Details","data": data})

#all person 
def all_people(request):
    data = People.objects.all()
    return render(request, 'front/all_lost_people.html', {"title": "নিখোঁজ ব্যক্তি গন","data": data})


# login function
def mylogin(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        utxt = request.POST.get('username')
        upass = request.POST.get('password')
        print(utxt,upass)
        if utxt != "" and upass != "":
            user = authenticate(username=utxt,password=upass)
            if user != None:
                login(request,user)
                return redirect('/')
    return render(request, 'front/login.html',{"title":"লগ ইন"})

# logout function
def mylogout(request):
    logout(request)
    return redirect('/')

# check the value is an integer or not
def is_number(num):
    try:
        float(num)
        return True
    except ValueError:
        pass

    try:
        import unicodedata
        unicodedata.numeric(num)
        return True
    except(TypeError,ValueError):
        pass
    
    return False

# view for capturing images and get those data to set them on their database
def TakeImages(request):
    p_id = request.POST['p_id']
    nick_name = request.POST['nick_name']
    if(is_number(p_id) and nick_name.isalpha()):
        if request.method == 'POST':
            dataform = InfoForm(request.POST,request.FILES)
            if dataform.is_valid():
                try:
                    p_id = dataform.cleaned_data['p_id']
                    nick_name = dataform.cleaned_data['nick_name']
                    full_name = dataform.cleaned_data['full_name']
                    address = dataform.cleaned_data['address']
                    blood_group = dataform.cleaned_data['blood_group']
                    special_mark = dataform.cleaned_data['special_mark']
                    age = dataform.cleaned_data['age']
                    gardian_name = dataform.cleaned_data['gardian_name']
                    gardian_phone_number = dataform.cleaned_data['gardian_phone_number']
                    skin_tone = dataform.cleaned_data['skin_tone']
                    dress_up = dataform.cleaned_data['dress_up']
                    phone_number = dataform.cleaned_data['phone_number']
                    last_location = dataform.cleaned_data['last_location']
                    miscellaneous = dataform.cleaned_data['miscellaneous']
                    image = dataform.cleaned_data['image']
                    print(image)
                    dataform.save()
                except:
                    pass
        cam = cv2.VideoCapture(0)
        harcascadePath = settings.BASE_DIR + \
            "\main\static\cascade\haarcascade_frontalface_default.xml"
        detector = cv2.CascadeClassifier(harcascadePath)
        print(harcascadePath)
        print(detector)
        sampleNum = 0
        while(True):
            ret, img = cam.read()
            gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            faces = detector.detectMultiScale(gray, 1.3, 5)
            for (x, y, w, h) in faces:
                cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
                #incrementing sample number
                sampleNum = sampleNum+1
                #saving the captured face in the dataset folder TrainingImage
                cv2.imwrite(settings.BASE_DIR+"\main\static\TrainingImage\ "+nick_name + "."+p_id + '.' +
                            str(sampleNum) + ".jpg", gray[y:y+h, x:x+w])
                #display the frame
                cv2.imshow('frame', img)
            #wait for 100 miliseconds
            if cv2.waitKey(100) & 0xFF == ord('q'):
                break
            # break if the sample number is morethan 100
            elif sampleNum > 60:
                break
        cam.release()
        cv2.destroyAllWindows()
        res = "Images Saved for ID : " + p_id + " Name : " + nick_name
        row = [p_id,nick_name]
        with open(settings.BASE_DIR+'\main\static\LostPeopleDetails\LostPeopleDetails.csv', 'a+') as csvFile:
            writer = csv.writer(csvFile)
            writer.writerow(row)
        csvFile.close()
        return render(request, 'front/message.html', {"title": "Track", "message": res, "value": "1"})
    else:
        if(is_number(p_id)):
            res = "Enter Alphabatic Name"
            return render(request, "front/message.html", {"title": "Track", "message": res, "value": "0"})
        if(nick_name.isalpha()):
            res = "Enter Numeric Id"
            return render(request, "front/message.html", {"title": "Track", "message": res, "value": "0"})

# model trainer
def TrainImages(request):
    recognizer = cv2.face_LBPHFaceRecognizer.create()
    # recognizer = cv2.xfeatures2d.SURF_create()
    harcascadePath = settings.BASE_DIR + "\main\static\cascade\haarcascade_frontalface_default.xml"
    detector = cv2.CascadeClassifier(harcascadePath)
    faces, Id = getImagesAndLabels(settings.BASE_DIR+"\main\static\TrainingImage")
    recognizer.train(faces, np.array(Id))
    recognizer.save(settings.BASE_DIR+"\main\static\Model\Training.yml")
    res = "Image Has Trained Successfully"
    return render(request, "front/message.html", {"title": "Train", "message": res, "value": '3'})

# label and id separetor
def getImagesAndLabels(path):
    #get the path of all the files in the folder
    imagePaths = [os.path.join(path, f) for f in os.listdir(path)]
    #print(imagePaths)

    #create empth face list
    faces = []
    #create empty ID list
    Ids = []
    #now looping through all the image paths and loading the Ids and the images
    for imagePath in imagePaths:
        #loading the image and converting it to gray scale
        pilImage = Image.open(imagePath).convert('L')
        #Now we are converting the PIL image into numpy array
        imageNp = np.array(pilImage, 'uint8')
        #getting the Id from the image
        Id = int(os.path.split(imagePath)[-1].split(".")[1])
        # extract the face from the training image sample
        faces.append(imageNp)
        Ids.append(Id)
    return faces, Ids

# trackpage view for search form
def trackpage(request):
    form = SearchForm()
    data = People.objects.all()
    return render(request, 'front/trackpage.html',{"title":"খুজুন","form":form,"data":data})

# image recognition view with web cam
def TrackWebCam(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    else:
        recognizer = cv2.face.LBPHFaceRecognizer_create()
        recognizer.read(settings.BASE_DIR+"\main\static\Model\Training.yml")
        harcascadePath = settings.BASE_DIR + \
            "\main\static\cascade\haarcascade_frontalface_default.xml"
        faceCascade = cv2.CascadeClassifier(harcascadePath)
        df = pd.read_csv(settings.BASE_DIR +
                         "\main\static\LostPeopleDetails\LostPeopleDetails.csv")
        cam = cv2.VideoCapture(0)
        font = cv2.FONT_HERSHEY_SIMPLEX
        col_names = ['Id', 'Name', 'Date', 'Time']
        track_moment = pd.DataFrame(columns=col_names)
        val = 0
        while True:
            ret, im = cam.read()
            gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
            faces = faceCascade.detectMultiScale(gray, 1.2, 5)
            for(x, y, w, h) in faces:
                cv2.rectangle(im, (x, y), (x+w, y+h), (225, 0, 0), 2)
                Id, conf = recognizer.predict(gray[y:y+h, x:x+w])
                if(conf < 50):
                    ts = time.time()
                    date = datetime.datetime.fromtimestamp(
                        ts).strftime('%Y-%m-%d')
                    timeStamp = datetime.datetime.fromtimestamp(
                        ts).strftime('%H:%M:%S')
                    aa = df.loc[df['Id'] == Id]['Name'].values
                    tt = str(Id)+"-"+aa
                    val = Id
                    track_moment.loc[len(track_moment)] = [
                        Id, aa, date, timeStamp]

                else:
                    Id = 'Not In Database'
                    tt = str(Id)
                if(conf > 75):
                    noOfFile = len(os.listdir(settings.BASE_DIR +
                                              "\main\static\ImagesUnknown"))+1
                    cv2.imwrite(settings.BASE_DIR+"\main\static\ImagesUnknown\Image"+str(noOfFile) +
                                ".jpg", im[y:y+h, x:x+w])
                cv2.putText(im, str(tt), (x, y+h), font,
                            0.5, (255, 255, 255), 1)
            track_moment = track_moment.drop_duplicates(
                subset=['Id'], keep='first')
            cv2.imshow('im', im)
            if (cv2.waitKey(1) == ord('q')):
                break
        ts = time.time()
        date = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d')
        timeStamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')
        Hour, Minute, Second = timeStamp.split(":")
        fileName = settings.BASE_DIR+"\main\static\Track\Track_Time_" + \
            date+"_"+Hour+"-"+Minute+"-"+Second+".csv"
        track_moment.to_csv(fileName, index=False)
        cam.release()
        cv2.destroyAllWindows()
        #print(track_moment)
        res = track_moment
        lost_people = People.objects.filter(p_id=val)
        # take = len(new_list)
        return render(request, 'front/lost_person_details.html', {"data": lost_people,"title":"Details"})

# image recognition view with images
def TrackImages(request):
    if request.method == 'POST':
        imageform = SearchForm(request.POST, request.FILES)
        if imageform.is_valid():
            try:
                image = imageform.cleaned_data['image']
                imageform.save()
            except:
                pass
    print(image)
    recognizer = cv2.face.LBPHFaceRecognizer_create() #creating the recognizer file
    # recognizer = cv2.face.xfeatures2d.SURF_create() #using surf algorithm to recognize that file
    recognizer.read(settings.BASE_DIR+"\main\static\Model\Training.yml")
    path = settings.BASE_DIR + "\media\search\{}".format(str(image))
    new_image = cv2.imread(path)
    gray = cv2.cvtColor(new_image, cv2.COLOR_BGR2GRAY)
    harcascadePath = cv2.CascadeClassifier(settings.BASE_DIR + "\main\static\cascade\haarcascade_frontalface_default.xml")
    df = pd.read_csv(settings.BASE_DIR +
                     "\main\static\LostPeopleDetails\LostPeopleDetails.csv")
    faces = harcascadePath.detectMultiScale(gray, 1.2, 5)
    val = 0
    for x,y,w,h in faces:
        cv2.rectangle(new_image, (x,y),(x+w, y+h), (255,0,0),5)
        Id,conf = recognizer.predict(gray[y:y+h, x:x+w])
        print(conf)
        if(conf < 50):
            val = Id
        else:
            Id = 'Not in Database'
        if(conf > 75):
            noOfFile = len(os.listdir(settings.BASE_DIR +
                                      "\main\static\ImagesUnknown"))+1
            cv2.imwrite(settings.BASE_DIR+"\main\static\ImagesUnknown\Image"+str(noOfFile) +
                        ".jpg", new_image[y:y+h, x:x+w])
    cv2.destroyAllWindows()
    data = People.objects.filter(p_id=val)
    return render(request, 'front/lost_person_details.html', {"data": data, "title": "Details"})


