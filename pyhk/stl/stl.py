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
    from . import _stl
else:
    import _stl

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


class SwigPyIterator(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")

    def __init__(self, *args, **kwargs):
        raise AttributeError("No constructor defined - class is abstract")
    __repr__ = _swig_repr
    __swig_destroy__ = _stl.delete_SwigPyIterator

    def value(self) -> "PyObject *":
        return _stl.SwigPyIterator_value(self)

    def incr(self, n: "size_t"=1) -> "swig::SwigPyIterator *":
        return _stl.SwigPyIterator_incr(self, n)

    def decr(self, n: "size_t"=1) -> "swig::SwigPyIterator *":
        return _stl.SwigPyIterator_decr(self, n)

    def distance(self, x: "SwigPyIterator") -> "ptrdiff_t":
        return _stl.SwigPyIterator_distance(self, x)

    def equal(self, x: "SwigPyIterator") -> "bool":
        return _stl.SwigPyIterator_equal(self, x)

    def copy(self) -> "swig::SwigPyIterator *":
        return _stl.SwigPyIterator_copy(self)

    def next(self) -> "PyObject *":
        return _stl.SwigPyIterator_next(self)

    def __next__(self) -> "PyObject *":
        return _stl.SwigPyIterator___next__(self)

    def previous(self) -> "PyObject *":
        return _stl.SwigPyIterator_previous(self)

    def advance(self, n: "ptrdiff_t") -> "swig::SwigPyIterator *":
        return _stl.SwigPyIterator_advance(self, n)

    def __eq__(self, x: "SwigPyIterator") -> "bool":
        return _stl.SwigPyIterator___eq__(self, x)

    def __ne__(self, x: "SwigPyIterator") -> "bool":
        return _stl.SwigPyIterator___ne__(self, x)

    def __iadd__(self, n: "ptrdiff_t") -> "swig::SwigPyIterator &":
        return _stl.SwigPyIterator___iadd__(self, n)

    def __isub__(self, n: "ptrdiff_t") -> "swig::SwigPyIterator &":
        return _stl.SwigPyIterator___isub__(self, n)

    def __add__(self, n: "ptrdiff_t") -> "swig::SwigPyIterator *":
        return _stl.SwigPyIterator___add__(self, n)

    def __sub__(self, *args) -> "ptrdiff_t":
        return _stl.SwigPyIterator___sub__(self, *args)
    def __iter__(self):
        return self

# Register SwigPyIterator in _stl:
_stl.SwigPyIterator_swigregister(SwigPyIterator)

class StringVector(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr

    def iterator(self) -> "swig::SwigPyIterator *":
        return _stl.StringVector_iterator(self)
    def __iter__(self):
        return self.iterator()

    def __nonzero__(self) -> "bool":
        return _stl.StringVector___nonzero__(self)

    def __bool__(self) -> "bool":
        return _stl.StringVector___bool__(self)

    def __len__(self) -> "std::vector< std::string >::size_type":
        return _stl.StringVector___len__(self)

    def __getslice__(self, i: "std::vector< std::string >::difference_type", j: "std::vector< std::string >::difference_type") -> "std::vector< std::string,std::allocator< std::string > > *":
        return _stl.StringVector___getslice__(self, i, j)

    def __setslice__(self, *args) -> "void":
        return _stl.StringVector___setslice__(self, *args)

    def __delslice__(self, i: "std::vector< std::string >::difference_type", j: "std::vector< std::string >::difference_type") -> "void":
        return _stl.StringVector___delslice__(self, i, j)

    def __delitem__(self, *args) -> "void":
        return _stl.StringVector___delitem__(self, *args)

    def __getitem__(self, *args) -> "std::vector< std::string >::value_type const &":
        return _stl.StringVector___getitem__(self, *args)

    def __setitem__(self, *args) -> "void":
        return _stl.StringVector___setitem__(self, *args)

    def pop(self) -> "std::vector< std::string >::value_type":
        return _stl.StringVector_pop(self)

    def append(self, x: "std::vector< std::string >::value_type const &") -> "void":
        return _stl.StringVector_append(self, x)

    def empty(self) -> "bool":
        return _stl.StringVector_empty(self)

    def size(self) -> "std::vector< std::string >::size_type":
        return _stl.StringVector_size(self)

    def swap(self, v: "StringVector") -> "void":
        return _stl.StringVector_swap(self, v)

    def begin(self) -> "std::vector< std::string >::iterator":
        return _stl.StringVector_begin(self)

    def end(self) -> "std::vector< std::string >::iterator":
        return _stl.StringVector_end(self)

    def rbegin(self) -> "std::vector< std::string >::reverse_iterator":
        return _stl.StringVector_rbegin(self)

    def rend(self) -> "std::vector< std::string >::reverse_iterator":
        return _stl.StringVector_rend(self)

    def clear(self) -> "void":
        return _stl.StringVector_clear(self)

    def get_allocator(self) -> "std::vector< std::string >::allocator_type":
        return _stl.StringVector_get_allocator(self)

    def pop_back(self) -> "void":
        return _stl.StringVector_pop_back(self)

    def erase(self, *args) -> "std::vector< std::string >::iterator":
        return _stl.StringVector_erase(self, *args)

    def __init__(self, *args):
        _stl.StringVector_swiginit(self, _stl.new_StringVector(*args))

    def push_back(self, x: "std::vector< std::string >::value_type const &") -> "void":
        return _stl.StringVector_push_back(self, x)

    def front(self) -> "std::vector< std::string >::value_type const &":
        return _stl.StringVector_front(self)

    def back(self) -> "std::vector< std::string >::value_type const &":
        return _stl.StringVector_back(self)

    def assign(self, n: "std::vector< std::string >::size_type", x: "std::vector< std::string >::value_type const &") -> "void":
        return _stl.StringVector_assign(self, n, x)

    def resize(self, *args) -> "void":
        return _stl.StringVector_resize(self, *args)

    def insert(self, *args) -> "void":
        return _stl.StringVector_insert(self, *args)

    def reserve(self, n: "std::vector< std::string >::size_type") -> "void":
        return _stl.StringVector_reserve(self, n)

    def capacity(self) -> "std::vector< std::string >::size_type":
        return _stl.StringVector_capacity(self)
    __swig_destroy__ = _stl.delete_StringVector

# Register StringVector in _stl:
_stl.StringVector_swigregister(StringVector)

class IntVector(object):
    thisown = property(lambda x: x.this.own(), lambda x, v: x.this.own(v), doc="The membership flag")
    __repr__ = _swig_repr

    def iterator(self) -> "swig::SwigPyIterator *":
        return _stl.IntVector_iterator(self)
    def __iter__(self):
        return self.iterator()

    def __nonzero__(self) -> "bool":
        return _stl.IntVector___nonzero__(self)

    def __bool__(self) -> "bool":
        return _stl.IntVector___bool__(self)

    def __len__(self) -> "std::vector< int >::size_type":
        return _stl.IntVector___len__(self)

    def __getslice__(self, i: "std::vector< int >::difference_type", j: "std::vector< int >::difference_type") -> "std::vector< int,std::allocator< int > > *":
        return _stl.IntVector___getslice__(self, i, j)

    def __setslice__(self, *args) -> "void":
        return _stl.IntVector___setslice__(self, *args)

    def __delslice__(self, i: "std::vector< int >::difference_type", j: "std::vector< int >::difference_type") -> "void":
        return _stl.IntVector___delslice__(self, i, j)

    def __delitem__(self, *args) -> "void":
        return _stl.IntVector___delitem__(self, *args)

    def __getitem__(self, *args) -> "std::vector< int >::value_type const &":
        return _stl.IntVector___getitem__(self, *args)

    def __setitem__(self, *args) -> "void":
        return _stl.IntVector___setitem__(self, *args)

    def pop(self) -> "std::vector< int >::value_type":
        return _stl.IntVector_pop(self)

    def append(self, x: "std::vector< int >::value_type const &") -> "void":
        return _stl.IntVector_append(self, x)

    def empty(self) -> "bool":
        return _stl.IntVector_empty(self)

    def size(self) -> "std::vector< int >::size_type":
        return _stl.IntVector_size(self)

    def swap(self, v: "IntVector") -> "void":
        return _stl.IntVector_swap(self, v)

    def begin(self) -> "std::vector< int >::iterator":
        return _stl.IntVector_begin(self)

    def end(self) -> "std::vector< int >::iterator":
        return _stl.IntVector_end(self)

    def rbegin(self) -> "std::vector< int >::reverse_iterator":
        return _stl.IntVector_rbegin(self)

    def rend(self) -> "std::vector< int >::reverse_iterator":
        return _stl.IntVector_rend(self)

    def clear(self) -> "void":
        return _stl.IntVector_clear(self)

    def get_allocator(self) -> "std::vector< int >::allocator_type":
        return _stl.IntVector_get_allocator(self)

    def pop_back(self) -> "void":
        return _stl.IntVector_pop_back(self)

    def erase(self, *args) -> "std::vector< int >::iterator":
        return _stl.IntVector_erase(self, *args)

    def __init__(self, *args):
        _stl.IntVector_swiginit(self, _stl.new_IntVector(*args))

    def push_back(self, x: "std::vector< int >::value_type const &") -> "void":
        return _stl.IntVector_push_back(self, x)

    def front(self) -> "std::vector< int >::value_type const &":
        return _stl.IntVector_front(self)

    def back(self) -> "std::vector< int >::value_type const &":
        return _stl.IntVector_back(self)

    def assign(self, n: "std::vector< int >::size_type", x: "std::vector< int >::value_type const &") -> "void":
        return _stl.IntVector_assign(self, n, x)

    def resize(self, *args) -> "void":
        return _stl.IntVector_resize(self, *args)

    def insert(self, *args) -> "void":
        return _stl.IntVector_insert(self, *args)

    def reserve(self, n: "std::vector< int >::size_type") -> "void":
        return _stl.IntVector_reserve(self, n)

    def capacity(self) -> "std::vector< int >::size_type":
        return _stl.IntVector_capacity(self)
    __swig_destroy__ = _stl.delete_IntVector

# Register IntVector in _stl:
_stl.IntVector_swigregister(IntVector)


def vector_int2str(input: "IntVector") -> "std::vector< std::string,std::allocator< std::string > >":
    return _stl.vector_int2str(input)


