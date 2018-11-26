from django.db import models
from .base import Asset


class ItAsset(Asset):
    it_asset_types = (
        (0, 'server'),
        (1, 'networkdevice'),
        (2, 'storagedevice'),
        (3, 'software'),
    )


class Server(models.Model):
    server_types = (
        (0, 'PC server'),
        (1, 'Blade server'),
        (2, 'Industrial personal computer '),
    )

    it_asset = models.OneToOneField('ItAsset', on_delete=None)
    server_type = models.SmallIntegerField(choices=server_types, default=0, verbose_name="Type of server")

    model = models.CharField(max_length=128, null=True, blank=True, verbose_name='Model of server')
    raid_type = models.CharField(max_length=512, blank=True, null=True, verbose_name='Raid type')

    os_type = models.CharField('OS type', max_length=64, blank=True, null=True)
    os_distribution = models.CharField('Distribution type', max_length=64, blank=True, null=True)
    os_release = models.CharField('Release type', max_length=64, blank=True, null=True)


class StorageDevice(models.Model):
    storage_device_types = (
        (0, 'Disk array'),
        (1, 'Network memory'),
        (2, 'Tape library'),
    )

    it_asset = models.OneToOneField('ItAsset', on_delete=None)
    storage_device_type = models.SmallIntegerField(choices=storage_device_types, default=0,
                                                   verbose_name="Type of storage device")


class NetworkDevice(models.Model):
    network_device_types = (
        (0, 'Router'),
        (1, 'Switcher'),
        (2, 'Load balancer'),
        (3, 'VPN'),
    )

    it_asset = models.OneToOneField('ItAsset', on_delete=None)
    network_device_type = models.SmallIntegerField(choices=network_device_types, default=0,
                                                   verbose_name="Type of network device")

    vlan_ip = models.GenericIPAddressField(blank=True, null=True, verbose_name="VLan IP")
    intranet_ip = models.GenericIPAddressField(blank=True, null=True, verbose_name="Intranet IP")

    model = models.CharField(max_length=128, null=True, blank=True, verbose_name="Model")
    port_num = models.SmallIntegerField(null=True, blank=True, verbose_name="Number of ports")
    device_detail = models.TextField(null=True, blank=True, verbose_name="Details")


class Software(models.Model):
    software_types = (
        (0, 'Operating system'),
        (1, 'Office Software'),
        (2, 'Analysis Software'),
    )

    software_type = models.SmallIntegerField(choices=software_types, default=0, verbose_name="Software type")
    license_num = models.IntegerField(default=1, verbose_name="License number")
    version = models.CharField(max_length=64, unique=True, help_text='eg. CentOS release 6.7 (Final)',
                               verbose_name='Version')


class CPU(models.Model):
    it_asset = models.OneToOneField('ItAsset', on_delete=None)
    cpu_model = models.CharField('CPU model', max_length=128, blank=True, null=True)
    cpu_count = models.PositiveSmallIntegerField('Number of CPU', default=1)
    cpu_core_count = models.PositiveSmallIntegerField('Core number', default=1)


class RAM(models.Model):
    it_asset = models.ForeignKey('ItAsset', on_delete=None)  # 只能通过外键关联Asset。否则不能同时关联服务器、网络设备等等。
    model = models.CharField('Model', max_length=128, blank=True, null=True)
    slot = models.CharField('Slot number', max_length=64)
    capacity = models.IntegerField('Capacity /GB', blank=True, null=True)

    sn = models.CharField('SN', max_length=128, blank=True, null=True)
    manufacturer = models.CharField('Manufacturer', max_length=128, blank=True, null=True)

    def __str__(self):
        return '%s: %s: %s: %s' % (self.it_asset.name, self.model, self.slot, self.capacity)

    class Meta:
        unique_together = ('it_asset', 'slot')  # 同一资产下的内存，根据插槽的不同，必须唯一


class Disk(models.Model):
    disk_interface_type_choice = (
        (0, 'SATA'),
        (1, 'SAS'),
        (2, 'SCSI'),
        (3, 'SSD'),
    )

    it_asset = models.ForeignKey('ItAsset', on_delete=None)
    slot = models.CharField('Slot location and type', help_text='eg. SATA0 PCIE1', max_length=64, blank=True, null=True)
    model = models.CharField('Model', max_length=128, blank=True, null=True)
    capacity = models.FloatField('Capacity /GB', blank=True, null=True)

    sn = models.CharField('SN', max_length=128, blank=True, null=True)
    manufacturer = models.CharField('Manufacturer', max_length=128, blank=True, null=True)

    class Meta:
        unique_together = ('it_asset', 'sn')


class NIC(models.Model):
    it_asset = models.ForeignKey('ItAsset', on_delete=None)
    name = models.CharField('NIC name', max_length=64, blank=True, null=True)
    model = models.CharField('NIC model', max_length=128)
    mac = models.CharField('MAC', max_length=64)
    ip_address = models.GenericIPAddressField('IP', blank=True, null=True)
    net_mask = models.CharField('Net mask', max_length=64, blank=True, null=True)
    bonding = models.CharField('Bonding address', max_length=64, blank=True, null=True)

    class Meta:
        unique_together = ('it_asset', 'model', 'mac')  # 资产、型号和mac必须联合唯一。防止虚拟机中的特殊情况发生错误。
