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

OBJECTS = big_file_C19_c.o 

OLDOBJECTS =  ty595.o ty595d.o ty596.o ty596d.o ty599.o ty599d.o ty600.o ty600d.o \
	ty603.o ty603d.o ty604.o ty604d.o ty607.o ty607d.o ty608.o ty608d.o \
	ty612.o ty612d.o ty613.o ty613d.o ty616.o ty616d.o ty617.o ty617d.o \
	ty620.o ty620d.o ty621.o ty621d.o ty624.o ty624d.o ty625.o ty625d.o \
	ty597.o ty597d.o ty601.o ty601d.o ty605.o ty605d.o ty609.o ty609d.o \
	ty614.o ty614d.o ty618.o ty618d.o ty622.o ty622d.o ty626.o ty626d.o \
	rt594.o rt594d.o rt598.o rt598d.o rt602.o rt602d.o rt606.o rt606d.o \
	rt610.o rt610d.o rt611.o rt611d.o rt615.o rt615d.o rt619.o rt619d.o \
	rt623.o rt623d.o 

all: Cobj19.o

Cobj19.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj19.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

