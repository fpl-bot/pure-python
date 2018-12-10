"""
This file create models for assets on field,
such as equipment,data collector and sensor...,
by inheriting from base.py-assets
"""
from django.db import models
from .base import Asset


class EquipmentGroup(Asset):
    """
    所有机组的共有资产表
    """
    equipment_group_types = (
        (0, 'TopDriver'),
        (1, 'Propeller'),
        (2, 'Generator'),
    )

    equipment_group_type = models.CharField(max_length=64, choices=equipment_group_types, null=True, blank=True,
                                            verbose_name='Type of equipment group')


class TopDriver(models.Model):
    """
    顶驱信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联
    drilling_depth = models.FloatField(null=True, blank=True, verbose_name='Nominal drilling depth /m')  # 名义钻井深度
    max_load = models.FloatField(null=True, blank=True, verbose_name='Maximum loading /kN')  # 最大载荷
    power_voltage = models.FloatField(null=True, blank=True, verbose_name='Power supply voltage /V')  # 供电电压
    power_frequency = models.FloatField(null=True, blank=True, verbose_name='Power supply frequency /Hz')  # 供电频率
    min_speed = models.FloatField(null=True, blank=True, verbose_name='Minimal rotation speed /rpm')  # 最小转速
    max_speed = models.FloatField(null=True, blank=True, verbose_name='Maximum rotation speed /rpm')  # 最大转速
    torque = models.FloatField(null=True, blank=True, verbose_name='Torque /kN.m')  # 工作扭矩


class Propeller(models.Model):
    """
    推进器信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联
    forward_force = models.FloatField(null=True, blank=True, verbose_name='Forward force /kg')  # 前向推力
    reverse_force = models.FloatField(null=True, blank=True, verbose_name='Reverse force /kg')  # 反向推力
    working_depth = models.FloatField(null=True, blank=True, verbose_name='Working depth /kg')  # 工作水深


class Generator(models.Model):
    """
    主机信息表
    """
    equipment_group = models.OneToOneField(EquipmentGroup, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联
    battery_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of batteries')  # 电池个数
    main_power = models.FloatField(null=True, blank=True, verbose_name='Main power /kW')  # 主功率
    backup_power = models.FloatField(null=True, blank=True, verbose_name='Backup power /kW')  # 备用功率


class Machine(Asset):
    """
    机组中机械设备的共有资产表
    """
    machine_types = (
        (0, 'Motor'),
        (1, 'GearBox'),
        (2, 'Engine'),
    )
    machine_type = models.CharField(max_length=64, choices=machine_types, null=True, blank=True,
                                    verbose_name='Type of machine')
    parent_equipment_group = models.ForeignKey(EquipmentGroup, on_delete=models.CASCADE, null=True,
                                               blank=True)  # 外键与父级机组关联


class Motor(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联
    efficiency = models.FloatField(null=True, blank=True, verbose_name='Efficiency /%')  # 效率
    phase_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of phases ')  # 相数
    pole_pairs_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of pole_pairs ')  # 极对数
    turn_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of turns ')  # 匝数
    rated_voltage = models.FloatField(null=True, blank=True, verbose_name='Rated voltage /V')  # 额定电压
    power_factor = models.FloatField(null=True, blank=True, verbose_name='Power factor ')  # 功率因数
    rated_speed = models.FloatField(null=True, blank=True, verbose_name='Rated speed /rpm')  # 额定转速


class GearBox(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联

    ratio = models.CharField(max_length=32, null=True, blank=True, verbose_name='Speed ratio')  # 减速比
    input_torque = models.FloatField(null=True, blank=True, verbose_name='Input torque/N.m')  # 输入力矩
    max_torque = models.FloatField(null=True, blank=True, verbose_name='Max torque/N.m')  # 最大转矩
    input_speed = models.FloatField(null=True, blank=True, verbose_name='Input speed/rpm')  # 输入转速


class Engine(models.Model):
    machine = models.OneToOneField(Machine, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联

    cylinder_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of cylinders')  # 气缸数目
    displacement = models.FloatField(null=True, blank=True, verbose_name='Displacement /L')  # 排量
    rated_fuel_consumption = models.FloatField(null=True, blank=True,
                                               verbose_name='Rated fuel consumption /g/km.h')  # 额定燃油耗
    rated_speed = models.FloatField(null=True, blank=True, verbose_name='Rated speed /rpm')  # 额定转速
    exhasut_gas_temp = models.FloatField(null=True, blank=True, verbose_name='exhasut gas temprature /C')  # 排气温度


class Component(Asset):
    """
    机械设备中部件的共有资产表
    """
    component_types = (
        (0, 'Bearing'),
        (1, 'Gear'),
        (2, 'Rotor'),
        (3, 'Stator'),
        (4, 'Shaft'),
    )
    component_type = models.CharField(choices=component_types, null=True, blank=True, max_length=64,
                                      verbose_name='Type of component')
    parent_machine = models.ForeignKey(Machine, on_delete=models.CASCADE, null=True, blank=True)  # 外键与父级机械关联


class Bearing(models.Model):
    component = models.OneToOneField(Component, on_delete=models.CASCADE)  # 一对一与机组共有资产表关联

    inner_race_diameter = models.FloatField(null=True, blank=True, verbose_name='Inner race diameter /mm')  # 内径
    inner_race_width = models.FloatField(null=True, blank=True, verbose_name='Inner race width /mm')  # 内圈宽度

    outter_race_diameter = models.FloatField(null=True, blank=True, verbose_name='Outter race diameter /mm')  # 外径
    outter_race_width = models.FloatField(null=True, blank=True, verbose_name='Outter race width /mm')  # 外圈宽度

    roller_diameter = models.FloatField(null=True, blank=True, verbose_name='Roller diameter /mm')  # 滚动体直径
    roller_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of rollers')  # 滚动体个数
    contact_angle = models.FloatField(null=True, blank=True, verbose_name='Contact angle ')  # 接触角


class Gear(models.Model):
    component = models.OneToOneField(Component, on_delete=models.CASCADE)

    teeth_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of tooth')  # 齿数
    modulus = models.FloatField(null=True, blank=True, verbose_name='Modulus')  # 模数

    diameter = models.FloatField(null=True, blank=True, verbose_name='Index circle diameter')  # 分度圆直径
    tip_diameter = models.FloatField(null=True, blank=True, verbose_name='Tip circle diameter')  # 齿顶圆直径
    root_diameter = models.FloatField(null=True, blank=True, verbose_name='Root circle diameter')  # 齿根圆直径


class Rotor(models.Model):
    component = models.OneToOneField(Component, on_delete=models.CASCADE)

    power = models.FloatField(null=True, blank=True, verbose_name='Power /kW')  # 功率
    length = models.FloatField(null=True, blank=True, verbose_name='Length /mm')  # 铁心长度
    outer_diameter = models.FloatField(null=True, blank=True, verbose_name='Outer diameter /mm')  # 外径
    inner_diameter = models.FloatField(null=True, blank=True, verbose_name='Inner diameter /mm')  # 内径
    slot_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of slots')  # 槽数


class Stator(models.Model):
    component = models.OneToOneField(Component, on_delete=models.CASCADE)

    power = models.FloatField(null=True, blank=True, verbose_name='Power /kW')  # 功率
    length = models.FloatField(null=True, blank=True, verbose_name='Length /mm')  # 铁心长度
    outer_diameter = models.FloatField(null=True, blank=True, verbose_name='Outer diameter /mm')  # 外径
    inner_diameter = models.FloatField(null=True, blank=True, verbose_name='Inner diameter /mm')  # 内径
    slot_number = models.SmallIntegerField(null=True, blank=True, verbose_name='Number of slots')  # 槽数


class MeasurePoint(models.Model):
    equipment_group = models.ForeignKey(EquipmentGroup, blank=True, null=True, on_delete=models.SET_NULL)
    machine = models.ForeignKey(Machine, blank=True, null=True, on_delete=models.SET_NULL)
    component = models.ForeignKey(Component, blank=True, null=True, on_delete=models.SET_NULL)
    sensor = models.ForeignKey('Sensor', blank=True, null=True, on_delete=models.SET_NULL)

    location = models.CharField(max_length=256, null=True, blank=True,
                                verbose_name='Description of the measuring point')


class Sensor(Asset):
    """
    所有传感器的共有资产表
    """
    sensor_types = (
        (0, 'Accelerator'),
        (1, 'CurrentProbe'),
        (2, 'TacoMeter'),
    )
    sensor_type = models.CharField(max_length=128, choices=sensor_types, null=True, blank=True,
                                   verbose_name='Type of sensor')
    data_collector = models.ForeignKey('DataCollector', null=True, blank=True, on_delete=models.SET_NULL)
    sampling_frequency = models.BigIntegerField(null=True, blank=True, verbose_name='Sampling frequency /Hz')
    sampling_interval = models.FloatField(null=True, blank=True, verbose_name='Sampling interval /s')


class DataCollector(Asset):
    """
    所有数据采集模块的共有资产表
    """
    data_collector_types = (
        (0, 'A/D converter'),
        (1, 'Amplifier'),
    )
    data_collector_type = models.CharField(max_length=128, choices=data_collector_types, null=True, blank=True,
                                           verbose_name='Type of data collector')
    parent_data_collector = models.ForeignKey('self', blank=True, null=True, on_delete=models.SET_NULL)
