from django.shortcuts import render
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.http import HttpResponse
from assets.models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import json
import assets.data_prepare as dp
import datetime
from django.http import JsonResponse
from django.db.models import Q


# Create your views here.

# @login_required(login_url='/account/login/')
# @csrf_exempt
def dashboard(request):
    if request.is_ajax():
        jsondata = {
            "health_equip": [EquipmentGroup.objects.filter(statu=0).count(),
                             Machine.objects.filter(statu=0).count(),
                             Component.objects.filter(statu=0).count(),
                             Sensor.objects.filter(statu=0).count()],
            "abnormal_equip": [EquipmentGroup.objects.filter(~Q(statu=0)).count(),
                               Machine.objects.filter(~Q(statu=0)).count(),
                               Component.objects.filter(~Q(statu=0)).count(),
                               Sensor.objects.filter(~Q(statu=0)).count()],
            "assets_statisitic": [EquipmentGroup.objects.all().count(),
                                  Machine.objects.all().count(),
                                  Component.objects.all().count(),
                                  Sensor.objects.all().count(),
                                  ],
            "signal_sample": SignalCollected.objects.last().get_waveform(),
            "signal_timelabel": SignalCollected.objects.last().get_timevector(),
            "signal_time": SignalCollected.objects.last().get_timetick(),
        }

        return JsonResponse(jsondata)

    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = dp.get_warninglogcount(now)
        SignalVolume = dp.get_signaltablevolume()
        SignalCount = SignalCollected.objects.all().count()
        return render(request, "assets/main/dashboard.html",
                      {"WarningLogCount": WarningLogCount,
                       "SignalVolume": SignalVolume,
                       "SignalCount": SignalCount,
                       })


def fft(request):
    if request.is_ajax():
        spec, freq = SignalCollected.objects.last().fft()
        jsondata = {
            "Transformed_Y": list(spec),
            "Transformed_X": list(freq),
            "Original_Y": SignalCollected.objects.last().get_waveform(),
            "Original_X": SignalCollected.objects.last().get_timevector(),
            "Time": SignalCollected.objects.last().get_timetick(),
        }
        return JsonResponse(jsondata)

    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = dp.get_warninglogcount(now)
        return render(request, "assets/analyzing/fft.html", {"WarningLogCount": WarningLogCount, })


def ht(request):
    if request.is_ajax():
        env_wave = SignalCollected.objects.last().envlope()
        jsondata = {
            "Transformed_Y": list(env_wave),
            "Transformed_X": SignalCollected.objects.last().get_timevector(),
            "Original_Y": SignalCollected.objects.last().get_waveform(),
            "Original_X": SignalCollected.objects.last().get_timevector(),
            "signal_time": SignalCollected.objects.last().get_timetick(),
        }
        return JsonResponse(jsondata)

    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = dp.get_warninglogcount(now)
        return render(request, "assets/analyzing/ht.html", {"WarningLogCount": WarningLogCount, })


def stft(request):
    if request.is_ajax():
        t, f, stft = SignalCollected.objects.last().stft()
        jsondata = {
            "t": list(t),
            "f": list(f),
            "stft": stft,
            "Original_Y": SignalCollected.objects.last().get_waveform(),
            "Original_X": SignalCollected.objects.last().get_timevector(),
            "signal_time": SignalCollected.objects.last().get_timetick(),
        }
        return JsonResponse(jsondata)

    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = dp.get_warninglogcount(now)
        return render(request, "assets/analyzing/stft.html", {"WarningLogCount": WarningLogCount, })


def wp(request):
    if request.is_ajax():
        x, y, wp = SignalCollected.objects.last().wavelet_pack()
        jsondata = {
            "x": x,
            "y": y,
            "wp": wp,
            "Original_Y": SignalCollected.objects.last().get_waveform(),
            "Original_X": SignalCollected.objects.last().get_timevector(),
            "signal_time": SignalCollected.objects.last().get_timetick(),
        }
        return JsonResponse(jsondata)

    if request.method == "GET":
        now = datetime.datetime.now()
        WarningLogCount = dp.get_warninglogcount(now)
        return render(request, "assets/analyzing/wp.html", {"WarningLogCount": WarningLogCount, })


def emd(request):
    signal = SignalCollected.objects.get(id=1)
    imfs = signal.emd()
    time = signal.get_timevector()
    return render(request, 'assets/analyzing/emd.html', {"imfs": imfs,
                                                         "time": time})


def treeview(request):
    if request.is_ajax():
        treejson = {'name': 'Offshore Platform', 'children': []}
        for eg in EquipmentGroup.objects.all():
            treejson['children'].append({'name': eg.name, 'children': []})
            for mc in eg.Machines.all():
                treejson['children'][-1]['children'].append({'name': mc.name, 'children': []})
                for mp in mc.MeasurePoints.all():
                    treejson['children'][-1]['children'][-1]['children'].append({'name': mp.id, 'label': mp.location})
        return JsonResponse(treejson)


def assets_overview(request):
    if request.method == "GET":
        now = datetime.datetime.now()
        EquipmentGroups = EquipmentGroup.objects.all()
        Machines = Machine.objects.all()
        Components = Component.objects.all()
        status = [EquipmentGroup.objects.filter(statu=i).count() +
                  Machine.objects.filter(statu=i).count() +
                  Component.objects.filter(statu=i).count()
                  for i in range(5)]
        WarningLogCount = dp.get_warninglogcount(now)
        return render(request, "assets/main/assets_overview.html",
                      {"WarningLogCount": WarningLogCount,
                       "EquipmentGroups": EquipmentGroups,
                       "Machines": Machines,
                       "Components": Components,
                       "status": status
                       })


def calender(request, year=2018):
    if request.is_ajax():
        warning_list = dp.get_warning_calender(year=year)
        return JsonResponse({'calender': warning_list})
