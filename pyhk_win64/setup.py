# -*- encoding: utf-8 -*-
"""
@File    : main.py
@Time    : 2020/2/22 14:12
@Author  : chise
@Email   : chise123@live.com
@Software: PyCharm
@info    :监控的主运行
只是一个属性集合，它描述了一个扩展模块和构建它所需要的所有东西(希望是以一种可移植的方式，但是有一些钩子可以让您根据需要进行不可移植)。
    Instance attributes:
      name : string
        包名，swig默认为_开头
      sources : [string]
        源文件可以是C、c++、SWIG (.i)、特定于平台的资源文件，
        或者“build_ext”命令识别为Python扩展的源代码的任何其他文件。
      include_dirs : [string]
      搜索C/ c++头文件的目录列表(Unix形式，便于携带)
      define_macros : [(name : string, value : string|None)]
        要定义的宏列表;每个宏都是使用2元组定义的，其中“value”要么是将其定义为
        字符串，要么是在没有特定值的情况下不定义它(等效于source中的“#define FOO”
        或Unix C编译器命令行的-DFOO)
      undef_macros : [string]
        list of macros to undefine explicitly
      library_dirs : [string]
        在链接时搜索C/ c++库的目录列表
      libraries : [string]
        要链接的库名(不是文件名或路径)列表
      runtime_library_dirs : [string]
        在运行时搜索C/ c++库的目录列表(对于共享扩展，这是加载扩展的时候)
      extra_objects : [string]
        要链接的额外文件列表(如非“源”隐含的目标文件、必须显式指定的静态库、二进制资源文件等。
      extra_compile_args : [string]
        在“源代码”中编译源文件时使用的任何特定于平台和编译器的额外信息。对于“命令行”有意义的平台和编译器，这通常是一个命令行参数列表，但是对于其他平台，它可以是任何东西。
      extra_link_args : [string]
        any extra platform- and compiler-specific information to use
        when linking object files together to create the extension (or
        to create a new static Python interpreter).  Similar
        interpretation as for 'extra_compile_args'.
      export_symbols : [string]
        list of symbols to be exported from a shared extension.  Not
        used on all platforms, and not generally necessary for Python
        extensions, which typically export exactly one symbol: "init" +
        extension_name.
      swig_opts : [string]
        如果源文件有i .扩展名，可以传递给SWIG的任何额外选项。
      depends : [string]
        list of files that the extension depends on
      language : string
        extension language (i.e. "c", "c++", "objc"). Will be detected
        from the source extensions if not provided.
      optional : boolean
        specifies that a build failure in the extension should not abort the
        build process, but simply not install the failing extension.
"""
from setuptools import Extension, find_packages, setup

setup(
    name='pyhk',
    version='0.4',
    description='A simple hk example',
    author='Chise',
    zip_safe=False,
    author_email='531189371@qq.com',
    packages=find_packages(".",include=["pyhk*"]),
    package_data={'':['*',"HCNetSDKCom/*"]},
)
