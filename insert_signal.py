
from assets.models import *
import os
import datetime
import numpy as np

root = "G:\Researchs\DATA\Diagnosis&Prognosis-Data\PHM2012\Learning_set\Bearing1_1"
files = os.listdir(root)
for file in files :
    onesig = np.loadtxt(root + '/' + files[0], delimiter=',')[:, 4]
    SignalCollected.objects.create(measurepoint=MeasurePoint.objects.get(id=2), wave=onesig)


initial_datetime = datetime.datetime(2014, 1, 1, 0, 0, 0, 0)
signals = SignalCollected.objects.all()
for signal in signals:
    signal.c_time = initial_datetime
    signal.save()
    initial_datetime += datetime.timedelta(days=1)
