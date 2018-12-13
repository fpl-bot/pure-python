from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.http import HttpResponse
from assets.models.data import WarningLog
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import datetime
import json
import calendar


# Create your views here.

#@login_required(login_url='/account/login/')
#@csrf_exempt
def dashboard(request):
    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = []
        for i in range(5):
            start = datetime.date(now.year, now.month-i, 1)
            end = datetime.date(now.year,now.month-i, calendar.monthrange(now.year,now.month-i)[-1])
            if now.month-i<=0:
                year = now.year-1
                month = 12-i+now.month
                start = datetime.date(year, month, 1)
                end = datetime.date(year,month,calendar.monthrange(year, month)[-1])
            WarningLogCount.append(WarningLog.objects.filter(c_day__range=(start,end)).count())

        return render(request, "assets/dashboard.html",
                      {"WarningLogCount": WarningLogCount})
