from django.conf.urls import url
# from django.urls import path
from . import views
urlpatterns = [
    url(r'^$', views.home, name ="home"),
    url(r'^about/$', views.about, name ="about"),
    url(r'^add/$', views.new_details, name ="new_details"),
    url(r'^login/$', views.mylogin, name ="mylogin"),
    url(r'^logout/$', views.mylogout, name ="mylogout"),
    url(r'^take/$', views.TakeImages, name ="TakeImages"),
    url(r'^train/$', views.TrainImages, name="TrainImages"),
    url(r'^track/$',views.trackpage,name="trackpage"),
    url(r'^trackweb/$',views.TrackWebCam,name="TrackWebCam"),
    url(r'^trackimg/$',views.TrackImages,name="TrackImages"),
]
