"""
This file creats models for virtural data
such as manufacturer, SIGNAL!, Contract
"""
from django.db import models
import numpy as np
from scipy import signal, fftpack
import pywt
from pyhht.emd import EMD
from .assets_onfield import MeasurePoint


class Manufacturer(models.Model):
    name = models.CharField('Manufacturer name', max_length=64, unique=True)
    telephone = models.CharField('Telephone', max_length=30, blank=True, null=True)
    memo = models.CharField('Memory', max_length=128, blank=True, null=True)


class Location(models.Model):
    name = models.CharField('Location', max_length=64)
    parent_location = models.ForeignKey('self', blank=True, null=True, on_delete=models.SET_NULL)


class Contract(models.Model):
    name = models.CharField('Contract name', max_length=64)
    memo = models.TextField('Memory', blank=True, null=True)
    price = models.IntegerField('Price')
    detail = models.TextField('Details', blank=True, null=True)
    start_time = models.DateField('Start time', blank=True, null=True)
    end_time = models.DateField('Out time', blank=True, null=True)
    c_time = models.DateField('Created time', auto_now_add=True,null=True)
    m_time = models.DateField('Modified time', auto_now=True)


class Tag(models.Model):
    name = models.CharField(max_length=32, unique=True, verbose_name='Tag name')
    c_day = models.DateField(auto_now_add=True, verbose_name='Created time')


class SignalCollected(models.Model):
    wave = models.TextField(blank=False, null=False, verbose_name='Collected Signal vector')
    measurepoint = models.ForeignKey(MeasurePoint, null=True, blank=True, on_delete=models.SET_NULL)
    c_time = models.DateTimeField(auto_now_add=True, verbose_name='Collected time')

    def get_wave_form(self):
        waveform = self.wave.split(';')
        return waveform

    def get_time_vector(self):
        time = [i / 10240 for i in range(len(self.get_wave_form()))]
        return time

    def fft(self):
        Signal = np.array(self.get_wave_form(), dtype=float)
        Signal = signal.detrend(Signal, type='constant')
        fft_size = int(Signal.shape[0])
        spec = np.fft.rfft(Signal)
        freq = np.linspace(0, 10240 / 2, fft_size / 2 + 1)
        spec = np.abs(spec)
        return spec, freq
        # freq, spec = signal.welch(Signal, 10240, scaling='spectrum')
        # return spec,freq

    def stft(self):
        Signal = np.array(self.get_wave_form(), dtype=float)
        Signal = signal.detrend(Signal, type='constant')
        f, t, Zxx = signal.stft(Signal, 10240, nperseg=128)
        Zxx = np.abs(Zxx)
        stft = []
        for i in range(Zxx.shape[0]):
            for j in range(Zxx.shape[1]):
                stft.append([j, i, Zxx[i, j]])
        return t, f, stft

    def envlope(self):
        Signal = np.array(self.get_wave_form(), dtype=float)
        Signal = signal.detrend(Signal, type='constant')
        Shiftted = fftpack.hilbert(Signal)
        Envelope = np.sqrt(Shiftted ** 2 + Signal ** 2)
        return Envelope

    def wavelet_pack(self):
        Signal = np.array(self.get_wave_form(), dtype=float)
        Signal = signal.detrend(Signal, type='constant')
        wp = pywt.WaveletPacket(Signal, 'db3', 'symmetric', maxlevel=4)
        nodes = wp.get_level(4, order='freq')
        values = np.array([n.data for n in nodes], 'd')
        wlp = []
        for i in range(values.shape[0]):
            for j in range(values.shape[1]):
                wlp.append([j, i, values[i, j]])
        x = [i for i in range(values.shape[0])]
        y = [i for i in range(values.shape[1])]
        return x, y, wlp

    def emd(self):
        Signal = np.array(self.get_wave_form(), dtype=float)
        Signal = signal.detrend(Signal, type='constant')
        decomposer = EMD(Signal)
        IMFs = decomposer.decompose()
        return IMFs.tolist()
