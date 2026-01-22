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

OBJECTS = big_file_C28_c.o 

OLDOBJECTS =  sp902.o sp902d.o ar910.o ar910d.o sp903.o sp903d.o na911.o na911d.o \
	re905.o re905d.o it906.o it906d.o ar912.o ar912d.o ar901.o ar901d.o \
	it907.o it907d.o li915.o li915d.o re897.o re897d.o in891.o in891d.o \
	to896.o to896d.o dy895.o dy895d.o ge900.o ge900d.o in908.o in908d.o \
	re904.o re904d.o se913.o se913d.o ar899.o ar899d.o cu917.o cu917d.o \
	tr916.o tr916d.o bo898.o bo898d.o ta892.o ta892d.o fi921.o fi921d.o \
	un894.o un894d.o ty909.o ty909d.o ac918.o ac918d.o bi923.o bi923d.o \
	dy893.o dy893d.o co914.o co914d.o ba919.o ba919d.o bo922.o bo922d.o \
	co920.o co920d.o 

all: Cobj28.o

Cobj28.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj28.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

