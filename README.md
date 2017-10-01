# faust-vst-makefile
This project is supposed to easily create a VST Plugin on Windows with the mingw compiler from Faust DSP code.

Just want to try out some DSP code quickly without writing any C++ and doing all the other nastly VST stuff?
Use Faust to write your DSP implementation in a few lines of code and use this makefile to easily create a fully functional VST plugin.

Requirements:
VST-SDK:

https://www.steinberg.net/en/company/developers.html

Faust:

https://github.com/grame-cncm/faust/tree/master

(for compiling faust: set the right compiler in the makefile and run "make win32")

Cygwin or MSYS2:

http://www.msys2.org/

https://cygwin.com/

You will only need to set the two paths in the top of the Makefile to the locations of Faust and the VST SDK.
Also, you might want to set the correct compiler.


