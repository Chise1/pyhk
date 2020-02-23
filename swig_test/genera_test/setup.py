#!/usr/bin/env python3

"""
setup.py file for SWIG swig_example
"""

from distutils.core import setup, Extension


example_module = Extension('_swig_example',
                           sources=['swig_example_wrap.cxx', 'swig_example.cpp'],
                           )

setup (name = 'swig_example',
       version = '0.1',
       author      = "SWIG Docs",
       description = """Simple swig example from docs""",
       ext_modules = [example_module],
       py_modules = ["swig_example"],
       )