from django.shortcuts import render
from django.shortcuts import render, HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login
from .form import LoginForm
from django.http import JsonResponse
from django.urls import reverse
import json
from django.urls import reverse


# Create your views here.
def auth_login(request):
    if request.method == "POST":
        ret = {"status": None, "url": None}
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            cd = login_form.cleaned_data
            user = authenticate(username=cd['username'], password=cd['password'])
            if user:
                login(request, user)
                ret["status"] = "success"
                ret["url"] = reverse('assets:dashboard')
                return JsonResponse(ret)
            else:
                ret["status"] = "failed"
                return JsonResponse(ret)
        else:
            ret["status"] = "invalid"
            ret["message"] = "Invalid information, pls check the information you input"
            return JsonResponse(ret)

    if request.method == 'GET':
        login_form = LoginForm()
        return render(request, 'registration/login.html', {"form": login_form})
