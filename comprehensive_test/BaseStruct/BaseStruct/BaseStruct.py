# This file was automatically generated by SWIG (http://www.swig.org).
# Version 3.0.12
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info >= (2, 7, 0):
    def swig_import_helper():
        import importlib
        pkg = __name__.rpartition('.')[0]
        mname = '.'.join((pkg, '_BaseStruct')).lstrip('.')
        try:
            return importlib.import_module(mname)
        except ImportError:
            return importlib.import_module('_BaseStruct')
    _BaseStruct = swig_import_helper()
    del swig_import_helper
elif _swig_python_version_info >= (2, 6, 0):
    def swig_import_helper():
        from os.path import dirname
        import imp
        fp = None
        try:
            fp, pathname, description = imp.find_module('_BaseStruct', [dirname(__file__)])
        except ImportError:
            import _BaseStruct
            return _BaseStruct
        try:
            _mod = imp.load_module('_BaseStruct', fp, pathname, description)
        finally:
            if fp is not None:
                fp.close()
        return _mod
    _BaseStruct = swig_import_helper()
    del swig_import_helper
else:
    import _BaseStruct
del _swig_python_version_info

try:
    _swig_property = property
except NameError:
    pass  # Python < 2.2 doesn't have 'property'.

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_setattr_nondynamic(self, class_type, name, value, static=1):
    if (name == "thisown"):
        return self.this.own(value)
    if (name == "this"):
        if type(value).__name__ == 'SwigPyObject':
            self.__dict__[name] = value
            return
    method = class_type.__swig_setmethods__.get(name, None)
    if method:
        return method(self, value)
    if (not static):
        if _newclass:
            object.__setattr__(self, name, value)
        else:
            self.__dict__[name] = value
    else:
        raise AttributeError("You cannot add attributes to %s" % self)


def _swig_setattr(self, class_type, name, value):
    return _swig_setattr_nondynamic(self, class_type, name, value, 0)


def _swig_getattr(self, class_type, name):
    if (name == "thisown"):
        return self.this.own()
    method = class_type.__swig_getmethods__.get(name, None)
    if method:
        return method(self)
    raise AttributeError("'%s' object has no attribute '%s'" % (class_type.__name__, name))


def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)

try:
    _object = object
    _newclass = 1
except __builtin__.Exception:
    class _object:
        pass
    _newclass = 0


def add(a: 'int', b: 'int') -> "int":
    return _BaseStruct.add(a, b)
add = _BaseStruct.add
class POINTER(_object):
    __swig_setmethods__ = {}
    __setattr__ = lambda self, name, value: _swig_setattr(self, POINTER, name, value)
    __swig_getmethods__ = {}
    __getattr__ = lambda self, name: _swig_getattr(self, POINTER, name)
    __repr__ = _swig_repr
    __swig_setmethods__["x"] = _BaseStruct.POINTER_x_set
    __swig_getmethods__["x"] = _BaseStruct.POINTER_x_get
    if _newclass:
        x = _swig_property(_BaseStruct.POINTER_x_get, _BaseStruct.POINTER_x_set)
    __swig_setmethods__["y"] = _BaseStruct.POINTER_y_set
    __swig_getmethods__["y"] = _BaseStruct.POINTER_y_get
    if _newclass:
        y = _swig_property(_BaseStruct.POINTER_y_get, _BaseStruct.POINTER_y_set)

    def __init__(self):
        this = _BaseStruct.new_POINTER()
        try:
            self.this.append(this)
        except __builtin__.Exception:
            self.this = this
    __swig_destroy__ = _BaseStruct.delete_POINTER
    __del__ = lambda self: None
POINTER_swigregister = _BaseStruct.POINTER_swigregister
POINTER_swigregister(POINTER)

class VECTOR(_object):
    __swig_setmethods__ = {}
    __setattr__ = lambda self, name, value: _swig_setattr(self, VECTOR, name, value)
    __swig_getmethods__ = {}
    __getattr__ = lambda self, name: _swig_getattr(self, VECTOR, name)
    __repr__ = _swig_repr
    __swig_setmethods__["x"] = _BaseStruct.VECTOR_x_set
    __swig_getmethods__["x"] = _BaseStruct.VECTOR_x_get
    if _newclass:
        x = _swig_property(_BaseStruct.VECTOR_x_get, _BaseStruct.VECTOR_x_set)
    __swig_setmethods__["y"] = _BaseStruct.VECTOR_y_set
    __swig_getmethods__["y"] = _BaseStruct.VECTOR_y_get
    if _newclass:
        y = _swig_property(_BaseStruct.VECTOR_y_get, _BaseStruct.VECTOR_y_set)
    __swig_setmethods__["vector_length"] = _BaseStruct.VECTOR_vector_length_set
    __swig_getmethods__["vector_length"] = _BaseStruct.VECTOR_vector_length_get
    if _newclass:
        vector_length = _swig_property(_BaseStruct.VECTOR_vector_length_get, _BaseStruct.VECTOR_vector_length_set)

    def __init__(self):
        this = _BaseStruct.new_VECTOR()
        try:
            self.this.append(this)
        except __builtin__.Exception:
            self.this = this
    __swig_destroy__ = _BaseStruct.delete_VECTOR
    __del__ = lambda self: None
VECTOR_swigregister = _BaseStruct.VECTOR_swigregister
VECTOR_swigregister(VECTOR)

class NET_DVR_TIME(_object):
    __swig_setmethods__ = {}
    __setattr__ = lambda self, name, value: _swig_setattr(self, NET_DVR_TIME, name, value)
    __swig_getmethods__ = {}
    __getattr__ = lambda self, name: _swig_getattr(self, NET_DVR_TIME, name)
    __repr__ = _swig_repr
    __swig_setmethods__["dwYear"] = _BaseStruct.NET_DVR_TIME_dwYear_set
    __swig_getmethods__["dwYear"] = _BaseStruct.NET_DVR_TIME_dwYear_get
    if _newclass:
        dwYear = _swig_property(_BaseStruct.NET_DVR_TIME_dwYear_get, _BaseStruct.NET_DVR_TIME_dwYear_set)
    __swig_setmethods__["dwMonth"] = _BaseStruct.NET_DVR_TIME_dwMonth_set
    __swig_getmethods__["dwMonth"] = _BaseStruct.NET_DVR_TIME_dwMonth_get
    if _newclass:
        dwMonth = _swig_property(_BaseStruct.NET_DVR_TIME_dwMonth_get, _BaseStruct.NET_DVR_TIME_dwMonth_set)
    __swig_setmethods__["dwDay"] = _BaseStruct.NET_DVR_TIME_dwDay_set
    __swig_getmethods__["dwDay"] = _BaseStruct.NET_DVR_TIME_dwDay_get
    if _newclass:
        dwDay = _swig_property(_BaseStruct.NET_DVR_TIME_dwDay_get, _BaseStruct.NET_DVR_TIME_dwDay_set)
    __swig_setmethods__["dwHour"] = _BaseStruct.NET_DVR_TIME_dwHour_set
    __swig_getmethods__["dwHour"] = _BaseStruct.NET_DVR_TIME_dwHour_get
    if _newclass:
        dwHour = _swig_property(_BaseStruct.NET_DVR_TIME_dwHour_get, _BaseStruct.NET_DVR_TIME_dwHour_set)
    __swig_setmethods__["dwMinute"] = _BaseStruct.NET_DVR_TIME_dwMinute_set
    __swig_getmethods__["dwMinute"] = _BaseStruct.NET_DVR_TIME_dwMinute_get
    if _newclass:
        dwMinute = _swig_property(_BaseStruct.NET_DVR_TIME_dwMinute_get, _BaseStruct.NET_DVR_TIME_dwMinute_set)
    __swig_setmethods__["dwSecond"] = _BaseStruct.NET_DVR_TIME_dwSecond_set
    __swig_getmethods__["dwSecond"] = _BaseStruct.NET_DVR_TIME_dwSecond_get
    if _newclass:
        dwSecond = _swig_property(_BaseStruct.NET_DVR_TIME_dwSecond_get, _BaseStruct.NET_DVR_TIME_dwSecond_set)

    def __init__(self):
        this = _BaseStruct.new_NET_DVR_TIME()
        try:
            self.this.append(this)
        except __builtin__.Exception:
            self.this = this
    __swig_destroy__ = _BaseStruct.delete_NET_DVR_TIME
    __del__ = lambda self: None
NET_DVR_TIME_swigregister = _BaseStruct.NET_DVR_TIME_swigregister
NET_DVR_TIME_swigregister(NET_DVR_TIME)

# This file is compatible with both classic and new-style classes.


