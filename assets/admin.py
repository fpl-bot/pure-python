from django.contrib import admin

# Register your models here.
from .models import *


class EquipmentGroupAdmin(admin.ModelAdmin):
    list_display = ['name', 'equipment_group_type', 'location', 'cr_time']
    ordering = ['equipment_group_type']
    radio_fields = {"equipment_group_type": admin.VERTICAL}


class TopDriverAdmin(admin.ModelAdmin):
    list_display = ['equipment_group', 'max_speed']
    ordering = ['equipment_group']


class PropellerAdmin(admin.ModelAdmin):
    list_display = ['equipment_group', 'working_depth']
    ordering = ['equipment_group']


class GeneratorAdmin(admin.ModelAdmin):
    list_display = ['equipment_group', 'main_power']
    ordering = ['equipment_group']


class MachineAdmin(admin.ModelAdmin):
    list_display = ['name', 'machine_type', 'parent_equipment_group']
    ordering = ['parent_equipment_group']
    list_filter = ("machine_type", "parent_equipment_group")
    radio_fields = {"machine_type": admin.VERTICAL}


class MotorAdmin(admin.ModelAdmin):
    list_display = ['machine', 'rated_voltage']
    ordering = ['machine']


class GearBoxAdmin(admin.ModelAdmin):
    list_display = ['machine', 'ratio']
    ordering = ['machine']


class EngineAdmin(admin.ModelAdmin):
    list_display = ['machine', 'displacement']
    ordering = ['machine']


class LocationAdmin(admin.ModelAdmin):
    list_display = ['name', 'parent_location']


class ComponentAdmin(admin.ModelAdmin):
    list_display = ['name', 'component_type', 'parent_machine']
    ordering = ['parent_machine']
    list_filter = ("component_type", "parent_machine")
    radio_fields = {"component_type": admin.VERTICAL}


class BearingAdmin(admin.ModelAdmin):
    list_display = ['component']
    ordering = ['component']


class GearAdmin(admin.ModelAdmin):
    list_display = ['component']
    ordering = ['component']


class RotorAdmin(admin.ModelAdmin):
    list_display = ['component']
    ordering = ['component']


class StatorAdmin(admin.ModelAdmin):
    list_display = ['component']
    ordering = ['component']


class MeasurePointAdmin(admin.ModelAdmin):
    list_display = ['id', 'equipment_group', 'machine', 'sensor', 'location']
    ordering = ['id']


class SensorAdmin(admin.ModelAdmin):
    list_display = ['id', 'name', 'sensor_type', 'sampling_frequency', 'sampling_interval']
    ordering = ['id']


class SignalAdmin(admin.ModelAdmin):
    list_display = ['id', 'measurepoint', 'c_time']


class WarningLogAdmin(admin.ModelAdmin):
    list_display = ['equipment_group', 'c_day','severity']
    radio_fields = {"equipment_group": admin.VERTICAL}


admin.site.register(EquipmentGroup, EquipmentGroupAdmin)
admin.site.register(TopDriver, TopDriverAdmin)
admin.site.register(Propeller, PropellerAdmin)
admin.site.register(Generator, GeneratorAdmin)

admin.site.register(Machine, MachineAdmin)
admin.site.register(Motor, MotorAdmin)
admin.site.register(GearBox, GearBoxAdmin)
admin.site.register(Engine, EngineAdmin)

admin.site.register(Component, ComponentAdmin)
admin.site.register(Bearing, BearingAdmin)
admin.site.register(Gear, GearAdmin)
admin.site.register(Rotor, RotorAdmin)
admin.site.register(Stator, StatorAdmin)

admin.site.register(MeasurePoint, MeasurePointAdmin)
admin.site.register(Sensor, SensorAdmin)

admin.site.register(Location, LocationAdmin)
admin.site.register(Manufacturer)
admin.site.register(SignalCollected, SignalAdmin)
admin.site.register(WarningLog, WarningLogAdmin)
