# This file was automatically generated by SWIG (http://www.swig.org).
# Version 4.0.1
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info < (2, 7, 0):
    raise RuntimeError("Python 2.7 or later required")

# Import the low-level C/C++ module
if __package__ or "." in __name__:
    from . import _hk_struct
else:
    import _hk_struct

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)


def _swig_setattr_nondynamic_instance_variable(set):
    def set_instance_attr(self, name, value):
        if name == "thisown":
            self.this.own(value)
        elif name == "this":
            set(self, name, value)
        elif hasattr(self, name) and isinstance(getattr(type(self), name), property):
            set(self, name, value)
        else:
            raise AttributeError("You cannot add instance attributes to %s" % self)
    return set_instance_attr


def _swig_setattr_nondynamic_class_variable(set):
    def set_class_attr(cls, name, value):
        if hasattr(cls, name) and not isinstance(getattr(cls, name), property):
            set(cls, name, value)
        else:
            raise AttributeError("You cannot add class attributes to %s" % cls)
    return set_class_attr


def _swig_add_metaclass(metaclass):
    """Class decorator for adding a metaclass to a SWIG wrapped class - a slimmed down version of six.add_metaclass"""
    def wrapper(cls):
        return metaclass(cls.__name__, cls.__bases__, cls.__dict__.copy())
    return wrapper


class _SwigNonDynamicMeta(type):
    """Meta class to enforce nondynamic attributes (no new attributes) for a class"""
    __setattr__ = _swig_setattr_nondynamic_class_variable(type.__setattr__)


import weakref

class NET_DVR_SETUPALARM_PARAM(object):
    r"""Proxy of C++ tagNET_DVR_SETUPALARM_PARAM class."""

    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    dwSize = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_dwSize_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_dwSize_set, doc=r"""dwSize""")
    byLevel = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byLevel_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byLevel_set, doc=r"""byLevel""")
    byAlarmInfoType = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byAlarmInfoType_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byAlarmInfoType_set, doc=r"""byAlarmInfoType""")
    byRetAlarmTypeV40 = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byRetAlarmTypeV40_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byRetAlarmTypeV40_set, doc=r"""byRetAlarmTypeV40""")
    byRetDevInfoVersion = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byRetDevInfoVersion_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byRetDevInfoVersion_set, doc=r"""byRetDevInfoVersion""")
    byRetVQDAlarmType = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byRetVQDAlarmType_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byRetVQDAlarmType_set, doc=r"""byRetVQDAlarmType""")
    byFaceAlarmDetection = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byFaceAlarmDetection_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byFaceAlarmDetection_set, doc=r"""byFaceAlarmDetection""")
    bySupport = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_bySupport_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_bySupport_set, doc=r"""bySupport""")
    byBrokenNetHttp = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byBrokenNetHttp_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byBrokenNetHttp_set, doc=r"""byBrokenNetHttp""")
    wTaskNo = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_wTaskNo_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_wTaskNo_set, doc=r"""wTaskNo""")
    byDeployType = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byDeployType_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byDeployType_set, doc=r"""byDeployType""")
    byRes1 = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byRes1_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byRes1_set, doc=r"""byRes1""")
    byAlarmTypeURL = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byAlarmTypeURL_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byAlarmTypeURL_set, doc=r"""byAlarmTypeURL""")
    byCustomCtrl = property(_hk_struct.NET_DVR_SETUPALARM_PARAM_byCustomCtrl_get, _hk_struct.NET_DVR_SETUPALARM_PARAM_byCustomCtrl_set, doc=r"""byCustomCtrl""")

    def __init__(self):
        r"""__init__(self) -> NET_DVR_SETUPALARM_PARAM"""
        _hk_struct.NET_DVR_SETUPALARM_PARAM_swiginit(self, _hk_struct.new_NET_DVR_SETUPALARM_PARAM())
    __swig_destroy__ = _hk_struct.delete_NET_DVR_SETUPALARM_PARAM

# Register NET_DVR_SETUPALARM_PARAM in _hk_struct:
_hk_struct.NET_DVR_SETUPALARM_PARAM_swigregister(NET_DVR_SETUPALARM_PARAM)

class NET_DVR_ALARMER(object):
    r"""Proxy of C++ NET_DVR_ALARMER class."""

    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    byUserIDValid = property(_hk_struct.NET_DVR_ALARMER_byUserIDValid_get, _hk_struct.NET_DVR_ALARMER_byUserIDValid_set, doc=r"""byUserIDValid""")
    bySerialValid = property(_hk_struct.NET_DVR_ALARMER_bySerialValid_get, _hk_struct.NET_DVR_ALARMER_bySerialValid_set, doc=r"""bySerialValid""")
    byVersionValid = property(_hk_struct.NET_DVR_ALARMER_byVersionValid_get, _hk_struct.NET_DVR_ALARMER_byVersionValid_set, doc=r"""byVersionValid""")
    byDeviceNameValid = property(_hk_struct.NET_DVR_ALARMER_byDeviceNameValid_get, _hk_struct.NET_DVR_ALARMER_byDeviceNameValid_set, doc=r"""byDeviceNameValid""")
    byMacAddrValid = property(_hk_struct.NET_DVR_ALARMER_byMacAddrValid_get, _hk_struct.NET_DVR_ALARMER_byMacAddrValid_set, doc=r"""byMacAddrValid""")
    byLinkPortValid = property(_hk_struct.NET_DVR_ALARMER_byLinkPortValid_get, _hk_struct.NET_DVR_ALARMER_byLinkPortValid_set, doc=r"""byLinkPortValid""")
    byDeviceIPValid = property(_hk_struct.NET_DVR_ALARMER_byDeviceIPValid_get, _hk_struct.NET_DVR_ALARMER_byDeviceIPValid_set, doc=r"""byDeviceIPValid""")
    bySocketIPValid = property(_hk_struct.NET_DVR_ALARMER_bySocketIPValid_get, _hk_struct.NET_DVR_ALARMER_bySocketIPValid_set, doc=r"""bySocketIPValid""")
    lUserID = property(_hk_struct.NET_DVR_ALARMER_lUserID_get, _hk_struct.NET_DVR_ALARMER_lUserID_set, doc=r"""lUserID""")
    sSerialNumber = property(_hk_struct.NET_DVR_ALARMER_sSerialNumber_get, _hk_struct.NET_DVR_ALARMER_sSerialNumber_set, doc=r"""sSerialNumber""")
    dwDeviceVersion = property(_hk_struct.NET_DVR_ALARMER_dwDeviceVersion_get, _hk_struct.NET_DVR_ALARMER_dwDeviceVersion_set, doc=r"""dwDeviceVersion""")
    sDeviceName = property(_hk_struct.NET_DVR_ALARMER_sDeviceName_get, _hk_struct.NET_DVR_ALARMER_sDeviceName_set, doc=r"""sDeviceName""")
    byMacAddr = property(_hk_struct.NET_DVR_ALARMER_byMacAddr_get, _hk_struct.NET_DVR_ALARMER_byMacAddr_set, doc=r"""byMacAddr""")
    wLinkPort = property(_hk_struct.NET_DVR_ALARMER_wLinkPort_get, _hk_struct.NET_DVR_ALARMER_wLinkPort_set, doc=r"""wLinkPort""")
    sDeviceIP = property(_hk_struct.NET_DVR_ALARMER_sDeviceIP_get, _hk_struct.NET_DVR_ALARMER_sDeviceIP_set, doc=r"""sDeviceIP""")
    sSocketIP = property(_hk_struct.NET_DVR_ALARMER_sSocketIP_get, _hk_struct.NET_DVR_ALARMER_sSocketIP_set, doc=r"""sSocketIP""")
    byIpProtocol = property(_hk_struct.NET_DVR_ALARMER_byIpProtocol_get, _hk_struct.NET_DVR_ALARMER_byIpProtocol_set, doc=r"""byIpProtocol""")
    byRes1 = property(_hk_struct.NET_DVR_ALARMER_byRes1_get, _hk_struct.NET_DVR_ALARMER_byRes1_set, doc=r"""byRes1""")
    bJSONBroken = property(_hk_struct.NET_DVR_ALARMER_bJSONBroken_get, _hk_struct.NET_DVR_ALARMER_bJSONBroken_set, doc=r"""bJSONBroken""")
    wSocketPort = property(_hk_struct.NET_DVR_ALARMER_wSocketPort_get, _hk_struct.NET_DVR_ALARMER_wSocketPort_set, doc=r"""wSocketPort""")
    byRes2 = property(_hk_struct.NET_DVR_ALARMER_byRes2_get, _hk_struct.NET_DVR_ALARMER_byRes2_set, doc=r"""byRes2""")

    def __init__(self):
        r"""__init__(self) -> NET_DVR_ALARMER"""
        _hk_struct.NET_DVR_ALARMER_swiginit(self, _hk_struct.new_NET_DVR_ALARMER())
    __swig_destroy__ = _hk_struct.delete_NET_DVR_ALARMER

# Register NET_DVR_ALARMER in _hk_struct:
_hk_struct.NET_DVR_ALARMER_swigregister(NET_DVR_ALARMER)

class NET_DVR_ALARMINFO_V30(object):
    r"""Proxy of C++ NET_DVR_ALARMINFO_V30 class."""

    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    dwAlarmType = property(_hk_struct.NET_DVR_ALARMINFO_V30_dwAlarmType_get, _hk_struct.NET_DVR_ALARMINFO_V30_dwAlarmType_set, doc=r"""dwAlarmType""")
    dwAlarmInputNumber = property(_hk_struct.NET_DVR_ALARMINFO_V30_dwAlarmInputNumber_get, _hk_struct.NET_DVR_ALARMINFO_V30_dwAlarmInputNumber_set, doc=r"""dwAlarmInputNumber""")
    byAlarmOutputNumber = property(_hk_struct.NET_DVR_ALARMINFO_V30_byAlarmOutputNumber_get, _hk_struct.NET_DVR_ALARMINFO_V30_byAlarmOutputNumber_set, doc=r"""byAlarmOutputNumber""")
    byAlarmRelateChannel = property(_hk_struct.NET_DVR_ALARMINFO_V30_byAlarmRelateChannel_get, _hk_struct.NET_DVR_ALARMINFO_V30_byAlarmRelateChannel_set, doc=r"""byAlarmRelateChannel""")
    byChannel = property(_hk_struct.NET_DVR_ALARMINFO_V30_byChannel_get, _hk_struct.NET_DVR_ALARMINFO_V30_byChannel_set, doc=r"""byChannel""")
    byDiskNumber = property(_hk_struct.NET_DVR_ALARMINFO_V30_byDiskNumber_get, _hk_struct.NET_DVR_ALARMINFO_V30_byDiskNumber_set, doc=r"""byDiskNumber""")

    def __init__(self):
        r"""__init__(self) -> NET_DVR_ALARMINFO_V30"""
        _hk_struct.NET_DVR_ALARMINFO_V30_swiginit(self, _hk_struct.new_NET_DVR_ALARMINFO_V30())
    __swig_destroy__ = _hk_struct.delete_NET_DVR_ALARMINFO_V30

# Register NET_DVR_ALARMINFO_V30 in _hk_struct:
_hk_struct.NET_DVR_ALARMINFO_V30_swigregister(NET_DVR_ALARMINFO_V30)

class NET_DVR_DEVICEINFO_V30(object):
    r"""Proxy of C++ NET_DVR_DEVICEINFO_V30 class."""

    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr
    sSerialNumber = property(_hk_struct.NET_DVR_DEVICEINFO_V30_sSerialNumber_get, _hk_struct.NET_DVR_DEVICEINFO_V30_sSerialNumber_set, doc=r"""sSerialNumber""")
    byAlarmInPortNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byAlarmInPortNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byAlarmInPortNum_set, doc=r"""byAlarmInPortNum""")
    byAlarmOutPortNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byAlarmOutPortNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byAlarmOutPortNum_set, doc=r"""byAlarmOutPortNum""")
    byDiskNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byDiskNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byDiskNum_set, doc=r"""byDiskNum""")
    byDVRType = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byDVRType_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byDVRType_set, doc=r"""byDVRType""")
    byChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byChanNum_set, doc=r"""byChanNum""")
    byStartChan = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byStartChan_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byStartChan_set, doc=r"""byStartChan""")
    byAudioChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byAudioChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byAudioChanNum_set, doc=r"""byAudioChanNum""")
    byIPChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byIPChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byIPChanNum_set, doc=r"""byIPChanNum""")
    byZeroChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byZeroChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byZeroChanNum_set, doc=r"""byZeroChanNum""")
    byMainProto = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byMainProto_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byMainProto_set, doc=r"""byMainProto""")
    bySubProto = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySubProto_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySubProto_set, doc=r"""bySubProto""")
    bySupport = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport_set, doc=r"""bySupport""")
    bySupport1 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport1_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport1_set, doc=r"""bySupport1""")
    bySupport2 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport2_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport2_set, doc=r"""bySupport2""")
    wDevType = property(_hk_struct.NET_DVR_DEVICEINFO_V30_wDevType_get, _hk_struct.NET_DVR_DEVICEINFO_V30_wDevType_set, doc=r"""wDevType""")
    bySupport3 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport3_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport3_set, doc=r"""bySupport3""")
    byMultiStreamProto = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byMultiStreamProto_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byMultiStreamProto_set, doc=r"""byMultiStreamProto""")
    byStartDChan = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byStartDChan_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byStartDChan_set, doc=r"""byStartDChan""")
    byStartDTalkChan = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byStartDTalkChan_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byStartDTalkChan_set, doc=r"""byStartDTalkChan""")
    byHighDChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byHighDChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byHighDChanNum_set, doc=r"""byHighDChanNum""")
    bySupport4 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport4_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport4_set, doc=r"""bySupport4""")
    byLanguageType = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byLanguageType_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byLanguageType_set, doc=r"""byLanguageType""")
    byVoiceInChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byVoiceInChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byVoiceInChanNum_set, doc=r"""byVoiceInChanNum""")
    byStartVoiceInChanNo = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byStartVoiceInChanNo_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byStartVoiceInChanNo_set, doc=r"""byStartVoiceInChanNo""")
    bySupport5 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport5_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport5_set, doc=r"""bySupport5""")
    bySupport6 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport6_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport6_set, doc=r"""bySupport6""")
    byMirrorChanNum = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byMirrorChanNum_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byMirrorChanNum_set, doc=r"""byMirrorChanNum""")
    wStartMirrorChanNo = property(_hk_struct.NET_DVR_DEVICEINFO_V30_wStartMirrorChanNo_get, _hk_struct.NET_DVR_DEVICEINFO_V30_wStartMirrorChanNo_set, doc=r"""wStartMirrorChanNo""")
    bySupport7 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_bySupport7_get, _hk_struct.NET_DVR_DEVICEINFO_V30_bySupport7_set, doc=r"""bySupport7""")
    byRes2 = property(_hk_struct.NET_DVR_DEVICEINFO_V30_byRes2_get, _hk_struct.NET_DVR_DEVICEINFO_V30_byRes2_set, doc=r"""byRes2""")

    def __init__(self):
        r"""__init__(self) -> NET_DVR_DEVICEINFO_V30"""
        _hk_struct.NET_DVR_DEVICEINFO_V30_swiginit(self, _hk_struct.new_NET_DVR_DEVICEINFO_V30())
    __swig_destroy__ = _hk_struct.delete_NET_DVR_DEVICEINFO_V30

# Register NET_DVR_DEVICEINFO_V30 in _hk_struct:
_hk_struct.NET_DVR_DEVICEINFO_V30_swigregister(NET_DVR_DEVICEINFO_V30)


cvar = _hk_struct.cvar
sizeof_NET_DVR_ALARMINFO_V30 = cvar.sizeof_NET_DVR_ALARMINFO_V30
sizeof_NET_DVR_DEVICEINFO_V30 = cvar.sizeof_NET_DVR_DEVICEINFO_V30
sizeof_NET_DVR_SETUPALARM_PARAM = cvar.sizeof_NET_DVR_SETUPALARM_PARAM
sizeof_NET_DVR_ALARMER = cvar.sizeof_NET_DVR_ALARMER

