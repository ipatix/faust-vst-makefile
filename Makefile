# path to unpacked VST SDK, the path MUST NOT contain spaces or go and fix the makefile yourself
VSTSDKDIR = /cygdrive/c/
# path to faust git repository
FAUSTDIR = /cygdrive/c/

PLUGINNAME = myFaustPlugin

CXX       = i686-w64-mingw32-g++
CXXINCS   = -I"$(VSTSDKDIR)/pluginterfaces/vst2.x" -I"$(VSTSDKDIR)/public.sdk/source/vst2.x" -I"$(VSTSDKDIR)" -I"$(VSTSDKDIR)/vstgui.sf/vstgui" -I. -I"$(HOME)/whome/Documents/Git/faust/architecture"
CXXFLAGS  = $(CXXINCS) -DBUILDING_DLL=1 -mwindows -O3
STRIP	  = i686-w64-mingw32-strip

OBJ       = $(PLUGINNAME).o $(VSTSDKDIR)/public.sdk/source/vst2.x/vstplugmain.o $(VSTSDKDIR)/public.sdk/source/vst2.x/audioeffect.o $(VSTSDKDIR)/public.sdk/source/vst2.x/audioeffectx.o
BIN       = $(PLUGINNAME).dll

.PHONY: all clean

all: $(PLUGINNAME).dll

clean:
	rm -f $(OBJ) $(BIN)

$(BIN): $(OBJ)
	$(CXX) -shared -static -o $@ $^
	$(STRIP) -s $@

$(PLUGINNAME).cpp: $(PLUGINNAME).dsp
	$(FAUSTDIR)/compiler/faust.exe -a $(FAUSTDIR)/architecture/vst.cpp $< -o $@

%.o: %.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)
