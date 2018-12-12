from django.db import models
from django.contrib.auth.models import User


class Asset(models.Model):
    """
    This is a abstract model
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
    md_time = models.DateTimeField(auto_now=True, verbose_name='Modified date')
    cr_time = models.DateTimeField(auto_now_add=True, verbose_name='Created date')
    sr_time = models.DateTimeField(null=True, blank=True, verbose_name='Start running date')

    memo = models.TextField(null=True, blank=True, verbose_name='Memory')

    class Meta:
        abstract = True
