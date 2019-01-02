from django.contrib import admin
from django.urls import path, include
from account import views
app_name = 'account'
urlpatterns = [
    path('login/', views.auth_login, name='login'),

]