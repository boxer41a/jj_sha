INCLUDE_PATH =  -I"$(ISE_LIBRARY)/library/base/elks/encoding/implementation/include" -I"$(ISE_LIBRARY)/library/time/spec/include" 
SHELL = /bin/sh
CC = cc
CPP = c++
CFLAGS = -O0 -pipe -fno-common -fPIC  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"/Users/jjj/jj_eiffel/Eiffel_22.05/studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0   -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"/Users/jjj/jj_eiffel/Eiffel_22.05/studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
LDFLAGS = 
CCLDFLAGS =   
LDSHAREDFLAGS =   -dynamiclib -flat_namespace -undefined suppress -o
EIFLIB = "/Users/jjj/jj_eiffel/Eiffel_22.05/studio/spec/macosx-x86-64/lib/libwkbench.a"
EIFTEMPLATES = /Users/jjj/jj_eiffel/Eiffel_22.05/studio/config/macosx-x86-64/templates
LIBS = -lm
MAKE = make
AR = ar
LD = ld
MKDEP = \$(EIFFEL_SRC)/C/mkdep $(DPFLAGS) --
MV = /bin/mv
CP = /bin/cp
RANLIB = :
RM = /bin/rm -f
FILE_EXIST = 
RMDIR = 
X2C = "/Users/jjj/jj_eiffel/Eiffel_22.05/studio/spec/macosx-x86-64/bin/x2c"
SHAREDLINK = cc
SHAREDLIBS = -lm
SHARED_SUFFIX = .dylib
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = touch finished 
SYSTEM_IN_DYNAMIC_LIB = jj_sha_without_genericity_demo.dylib 

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C22_c.o 

OLDOBJECTS =  sp699.o sp699d.o sp722.o sp722d.o ar701.o ar701d.o sp700.o sp700d.o \
	sp723.o sp723d.o na702.o na702d.o re725.o re725d.o ar703.o ar703d.o \
	ar693.o ar693d.o ar718.o ar718d.o re715.o re715d.o in709.o in709d.o \
	to714.o to714d.o dy694.o dy694d.o dy713.o dy713d.o li707.o li707d.o \
	ge698.o ge698d.o re724.o re724d.o se704.o se704d.o ar717.o ar717d.o \
	dy706.o dy706d.o bo716.o bo716d.o ta695.o ta695d.o ta710.o ta710d.o \
	un712.o un712d.o ta696.o ta696d.o ch708.o ch708d.o bi705.o bi705d.o \
	dy711.o dy711d.o ta697.o ta697d.o di721.o di721d.o ar719.o ar719d.o \
	st720.o st720d.o 

all: Cobj22.o

Cobj22.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj22.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

