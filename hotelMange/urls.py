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
]
