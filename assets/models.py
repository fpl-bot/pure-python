from django.db import models
from django.contrib.auth.models import User
# Create your models here.
import numpy as np
from scipy import signal, fftpack
import pywt
from pyhht.emd import EMD


# Create your models here.


class Asset(models.Model):
    """
    所有设备模型的抽象基类，这个模型类不创建数据表
    """
    asset_status = (
        (0, 'online'),
        (1, 'offline'),
        (2, 'unknown'),
        (3, 'defective'),
        (4, 'backup'),
    )

    name = models.CharField(max_length=64, unique=True, verbose_name='Name of asset')
    sn = models.CharField(max_length=128, unique=True, verbose_name='Serial number')
    statu = models.SmallIntegerField(choices=asset_status, default=2, verbose_name='Asset statu')

    manufacturer = models.ForeignKey('Manufacturer', null=True, blank=True, on_delete=models.SET_NULL,
                                     verbose_name='Manufacturer')
    tags = models.ManyToManyField('Tag', null=True, blank=True, verbose_name='Tags')
    admin = models.ForeignKey(User, null=True, blank=True, verbose_name='Administrator', on_delete=models.SET_NULL)
    location = models.ForeignKey('Location', null=True, blank=True, verbose_name='Asset location',
                                 on_delete=models.SET_NULL)
    contract = models.ForeignKey('Contract', null=True, blank=True, verbose_name='Asset contract',
                                 on_delete=models.SET_NULL)

    lr_time = models.DateTimeField(null=True, blank=True, verbose_name='Last repair/check date')
    pr_time = models.DateTimeField(null=True, blank=True, verbose_name='Purchase date')
    md_time = models.DateTimeField(auto_now_add=True, verbose_name='Modified date')
    cr_time = models.DateTimeField(auto_now=True, verbose_name='Created date')
    sr_time = models.DateTimeField(null=True, blank=True, verbose_name='Start running date')

    memo = models.TextField(null=True, blank=True, verbose_name='Memory')

    class Meta:
        abstract = True


class EquipmentGroup(Asset):
    """
    所有机组的共有资产表
    """
    equipment_group_types = (
        'TopDriver',
        'Propeller',
        'Generator',
    )

    equipment_group_type = models.CharField(choices=equipment_group_types, null=True, blank=True,
                                            verbose_name='Type of equipment group')


class TopDriver(models.Model):
    """
    顶驱信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    drilling_depth = models.FloatField(verbose_name='Nominal drilling depth /m')  # 名义钻井深度
    max_load = models.FloatField(verbose_name='Maximum loading /kN')  # 最大载荷
    power_voltage = models.FloatField(verbose_name='Power supply voltage /V')  # 供电电压
    power_frequency = models.FloatField(verbose_name='Power supply frequency /Hz')  # 供电频率
    min_speed = models.FloatField(verbose_name='Minimal rotation speed /rpm')  # 最小转速
    max_speed = models.FloatField(verbose_name='Maximum rotation speed /rpm')  # 最大转速
    torque = models.FloatField(verbose_name='Torque /kN.m')  # 工作扭矩


class Propeller(models.Model):
    """
    推进器信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联


class Generator(models.Model):
    """
    主机信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联


class Machine(Asset):
    """
    机组中机械设备的共有资产表
    """
    machine_types = (
        'Motor',
        'GearBox',
        'Shaft',
    )
    machine_type = models.CharField(choices=machine_types, null=True, blank=True,
                                    verbose_name='Type of machine')


class Motor(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(EquipmentGroup, on_delete=models.SET_NULL)  # 外键与父级机组关联


class GearBox(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(EquipmentGroup, on_delete=models.SET_NULL)  # 外键与父级机组关联


class Shaft(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(EquipmentGroup, on_delete=models.SET_NULL)  # 外键与父级机组关联


class Component(Asset):
    """
    机械设备中部件的共有资产表
    """
    component_types = (
        'Bearing',
        'Gear',
        'Rotor',
        'Stator',
    )
    component_type = models.CharField(choices=component_types, null=True, blank=True,
                                      verbose_name='Type of component')


class Bearing(models.Model):
    component = models.OneToOneField(Component, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(Machine, on_delete=models.SET_NULL)  # 外键与父级机组关联


class Gear(models.Model):
    component = models.OneToOneField(Component, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(Machine, on_delete=models.SET_NULL)  # 外键与父级机组关联


class Rotor(models.Model):
    component = models.OneToOneField(Component, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(Machine, on_delete=models.SET_NULL)  # 外键与父级机组关联


class Stator(models.Model):
    component = models.OneToOneField(Component, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    parent_equipment_group = models.ForeignKey(Machine, on_delete=models.SET_NULL)  # 外键与父级机组关联


class MeasurePoint(models.Model):
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    machine = models.OneToOneField(Machine, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联
    component = models.OneToOneField(Component, on_delete=models.SET_NULL)  # 一对一与机组共有资产表关联

class Sensor(Asset):
    """
    所有传感器的共有资产表
    """
    sensor_types = (
        'Accelerator',
        'CurrentProbe',
        'TacoMeter',
    )
    sensor_type = models.CharField(choices=sensor_types, null=True, blank=True,
                                   verbose_name='Type of sensor')


class DataCollector(Asset):
    """
    所有数据采集模块的共有资产表
    """
    data_collector_types = (
        'A/D converter',
        'Amplifier',
    )
    pass


class Manufacturer(models.Model):
    pass


class Location(models.Model):
    pass


class Contract(models.Model):
    pass


class Tag(models.Model):
    pass
