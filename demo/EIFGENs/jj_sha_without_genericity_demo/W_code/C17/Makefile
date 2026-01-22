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

OBJECTS = big_file_C17_c.o 

OLDOBJECTS =  sp552.o sp552d.o fu559.o fu559d.o sp553.o sp553d.o re536.o re536d.o \
	it530.o it530d.o ar558.o ar558d.o it528.o it528d.o li529.o li529d.o \
	re555.o re555d.o in546.o in546d.o to551.o to551d.o dy550.o dy550d.o \
	li544.o li544d.o ge554.o ge554d.o in539.o in539d.o re537.o re537d.o \
	ar557.o ar557d.o dy543.o dy543d.o cu532.o cu532d.o tr531.o tr531d.o \
	bo556.o bo556d.o ta547.o ta547d.o co560.o co560d.o fi540.o fi540d.o \
	un549.o un549d.o ch545.o ch545d.o ty538.o ty538d.o ac533.o ac533d.o \
	bi542.o bi542d.o dy548.o dy548d.o ba534.o ba534d.o bo541.o bo541d.o \
	co535.o co535d.o 

all: Cobj17.o

Cobj17.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj17.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

