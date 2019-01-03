from django.urls import path
from assets import views

app_name = 'assets'
urlpatterns = [
    path('dashboard/', views.dashboard, name='dashboard'),
    path('fft/', views.fft, name='FFT'),
    path('ht/', views.ht, name='HT'),
    path('stft/', views.stft, name='STFT'),
    path('wp/', views.wp, name='WP'),
    path('emd/', views.emd, name='EMD'),
    path('tv/', views.treeview, name='Tree View'),
    path('assetoverview/', views.assets_overview, name='Asset Overview'),
    path('calender/', views.calender, name='Warning calender')
]
