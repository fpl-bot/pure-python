import datetime
import calendar
from assets.models.data import *
from assets.models.assets_onfield import EquipmentGroup, Machine, Component, Sensor
from django.db.models import Q
import pymysql


def get_warninglogcount(now):
    warninglogcount = []
    for i in range(5):
        start = datetime.date(now.year, now.month - i, 1)
        end = datetime.date(now.year, now.month - i, calendar.monthrange(now.year, now.month - i)[-1])
        if now.month - i <= 0:
            year = now.year - 1
            month = 12 - i + now.month
            start = datetime.date(year, month, 1)
            end = datetime.date(year, month, calendar.monthrange(year, month)[-1])
        warninglogcount.append(WarningLog.objects.filter(c_day__range=(start, end)).count())

    return warninglogcount


def get_signaltablevolume():
    db = pymysql.connect("localhost", "root", "", "information_schema")
    cursor = db.cursor()
    sql = """select concat(round(sum(data_length/1024/1024),2),'MB') as data from tables where table_schema='lesacre' and table_name='assets_signalcollected';"""
    cursor.execute(sql)
    results = cursor.fetchall()
    return str(results[0][0])


