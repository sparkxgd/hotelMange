"""hotelMange URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from hotel import views
from hotel import views_user
from hotel import views_base_floor
from hotel import views_base_roomtype
from hotel import views_base_room
from hotel import views_base_custumer
from hotel import views_base_checkin


urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index),
    path('users/', views_user.get_list),
    path('user_add/', views_user.add),
    path('user_edit/', views_user.edit),
    path('user_del/', views_user.delete),
    path('user_batchdel/', views_user.batchdel),
    path('floors/', views_base_floor.get_list),
    path('floor_add/', views_base_floor.add),
    path('floor_edit/', views_base_floor.edit),
    path('floor_del/', views_base_floor.delete),
    path('floor_batchdel/', views_base_floor.batchdel),
    path('floor_all/', views_base_floor.get_all_list),
    path('roomtypes/', views_base_roomtype.get_list),
    path('roomtype_add/', views_base_roomtype.add),
    path('roomtype_edit/', views_base_roomtype.edit),
    path('roomtype_del/', views_base_roomtype.delete),
    path('roomtype_batchdel/', views_base_roomtype.batchdel),
    path('roomtype_all/', views_base_roomtype.get_all_list),
    path('rooms/', views_base_room.get_list),
    path('room_add/', views_base_room.add),
    path('room_edit/', views_base_room.edit),
    path('room_del/', views_base_room.delete),
    path('room_batchdel/', views_base_room.batchdel),
    path('room_all/', views_base_room.get_all_list),
    path('room_by_f_n/', views_base_room.room_by_f_n),
    path('custumers/', views_base_custumer.get_list),
    path('custumer_add/', views_base_custumer.add),
    path('custumer_edit/', views_base_custumer.edit),
    path('custumer_del/', views_base_custumer.delete),
    path('custumer_batchdel/', views_base_custumer.batchdel),
    path('custumer_all/', views_base_custumer.get_all_list),
    path('checkins/', views_base_checkin.get_list),
    path('checkin_add/', views_base_checkin.add),
    path('checkin_edit/', views_base_checkin.edit),
    path('checkin_del/', views_base_checkin.delete),
    path('checkin_batchdel/', views_base_checkin.batchdel),
]
