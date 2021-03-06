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
        mname = '.'.join((pkg, '_base')).lstrip('.')
        try:
            return importlib.import_module(mname)
        except ImportError:
            return importlib.import_module('_base')
    _base = swig_import_helper()
    del swig_import_helper
elif _swig_python_version_info >= (2, 6, 0):
    def swig_import_helper():
        from os.path import dirname
        import imp
        fp = None
        try:
            fp, pathname, description = imp.find_module('_base', [dirname(__file__)])
        except ImportError:
            import _base
            return _base
        try:
            _mod = imp.load_module('_base', fp, pathname, description)
        finally:
            if fp is not None:
                fp.close()
        return _mod
    _base = swig_import_helper()
    del swig_import_helper
else:
    import _base
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

class PLAYRECT(_object):
    __swig_setmethods__ = {}
    __setattr__ = lambda self, name, value: _swig_setattr(self, PLAYRECT, name, value)
    __swig_getmethods__ = {}
    __getattr__ = lambda self, name: _swig_getattr(self, PLAYRECT, name)
    __repr__ = _swig_repr
    __swig_setmethods__["x"] = _base.PLAYRECT_x_set
    __swig_getmethods__["x"] = _base.PLAYRECT_x_get
    if _newclass:
        x = _swig_property(_base.PLAYRECT_x_get, _base.PLAYRECT_x_set)
    __swig_setmethods__["y"] = _base.PLAYRECT_y_set
    __swig_getmethods__["y"] = _base.PLAYRECT_y_get
    if _newclass:
        y = _swig_property(_base.PLAYRECT_y_get, _base.PLAYRECT_y_set)
    __swig_setmethods__["uWidth"] = _base.PLAYRECT_uWidth_set
    __swig_getmethods__["uWidth"] = _base.PLAYRECT_uWidth_get
    if _newclass:
        uWidth = _swig_property(_base.PLAYRECT_uWidth_get, _base.PLAYRECT_uWidth_set)
    __swig_setmethods__["uHeight"] = _base.PLAYRECT_uHeight_set
    __swig_getmethods__["uHeight"] = _base.PLAYRECT_uHeight_get
    if _newclass:
        uHeight = _swig_property(_base.PLAYRECT_uHeight_get, _base.PLAYRECT_uHeight_set)

    def __init__(self):
        this = _base.new_PLAYRECT()
        try:
            self.this.append(this)
        except __builtin__.Exception:
            self.this = this
    __swig_destroy__ = _base.delete_PLAYRECT
    __del__ = lambda self: None
PLAYRECT_swigregister = _base.PLAYRECT_swigregister
PLAYRECT_swigregister(PLAYRECT)


def add(a: 'int', b: 'int') -> "int":
    return _base.add(a, b)
add = _base.add
# This file is compatible with both classic and new-style classes.


