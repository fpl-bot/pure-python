
from assets.models import *
import os
import datetime
import numpy as np

root = "G:\Researchs\DATA\Diagnosis&Prognosis-Data\PHM2012\Learning_set\Bearing1_1"
files = os.listdir(root)
for file in files :
    loadtext = np.loadtxt(root + '/' + file, delimiter=',')[:, 4]
    temp = loadtext.tolist()
    onesig = ''
    for item in temp:
        onesig = onesig + str(item)+';'

    SignalCollected.objects.create(measurepoint=MeasurePoint.objects.get(id=2), wave=onesig.strip(' '))


initial_datetime = datetime.datetime(2014, 1, 1, 0, 0, 0, 0)
signals = SignalCollected.objects.all()
for signal in signals:
    signal.c_time = initial_datetime
    signal.save()
    initial_datetime += datetime.timedelta(days=1)
