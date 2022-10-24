# rRootage makefile(MinGW 2.0.0)
# $Id: Makefile,v 1.6 2003/08/10 03:21:28 kenta Exp $

NAME   = rr
O      = o
RM     = rm -f
#CC     = /usr/local/gp2xdev/bin/gp2x-gcc
#CXX    = /usr/local/gp2xdev/bin/gp2x-g++
CC = /opt/gcw0-toolchain/usr/bin/mipsel-gcw0-linux-uclibc-gcc
CXX = /opt/gcw0-toolchain/usr/bin/mipsel-gcw0-linux-uclibc-g++


PROG   = $(NAME)

#DEFAULT_CFLAGS = `/usr/local/gp2xdev/bin/sdl-config --cflags`  -I/src/gpu940/include/
DEFAULT_CFLAGS = -DGCW -DLINUX -O2 -DEGL_NO_X11 -mno-shared -Wall -DNDEBUG -I./bulletml \
                 `/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/bin/sdl-config --cflags`  \
                 -I/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/include \
                 -I/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/include/libdrm
#senquack TODO: remember to add WIZ define to Makefile
#LDFLAGS        =  -static  `/usr/local/gp2xdev/bin/sdl-config --libs` -lpng -L. -lbulletml -lSDL_mixer -lSDL_image -lpng -mwindows -lstdc++ -lGL -lm -lpthread -lz -lpng -ljpeg -lgpu940 -lsmpeg -lvorbisidec `/usr/local/gp2xdev/bin/sdl-config --libs`
#     -lglu32 -lopengl32 -lmingw32 -lmingwex
LDFLAGS        = `/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/bin/sdl-config --libs` -lGLESv1_CM -lEGL -lshake \
                 -L./bulletml/ -lbulletml -lSDL_mixer -lSDL_image -lstdc++ -lm -lpthread -lz -ldrm -lgbm

#MORE_CFLAGS = -DLINUX -O0 -Wall -g
#MORE_CFLAGS = -DLINUX -O2 -Wall -DNDEBUG 

MORE_CFLAGS = -std=gnu99 
MORE_CPPFLAGS = -fno-rtti -fno-exceptions

#NOTE: -flto causes bugs under GCW MIPS toolchain, do not use:
#MORE_CFLAGS += -flto
#LDFLAGS += -flto

CFLAGS   = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) 
CPPFLAGS = $(DEFAULT_CFLAGS) $(MORE_CPPLAGS)

#OBJS =	$(NAME).$(O) \
#	foe.$(O) foecommand.$(O) barragemanager.$(O) boss.$(O) ship.$(O) laser.$(O) \
#	frag.$(O) background.$(O) letterrender.$(O) shot.$(O) \
#	screen.$(O) vector.$(O) degutil.$(O) rand.$(O) mt19937int.$(O) \
#	soundmanager.$(O) attractmanager.$(O) minimal.$(O)
#	# \
#	#$(NAME)_res.$(O)
OBJS =	$(NAME).$(O) \
	foe.$(O) foecommand.$(O) barragemanager.$(O) boss.$(O) ship.$(O) laser.$(O) \
	frag.$(O) background.$(O) letterrender.$(O) shot.$(O) \
	screen.$(O) vector.$(O) degutil.$(O) rand.$(O) mt19937int.$(O) \
	soundmanager.$(O) attractmanager.$(O) 
	# \
	#$(NAME)_res.$(O)

$(PROG): $(OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(OBJS) $(LDFLAGS)

#$(NAME)_res.o: $(NAME).rc
#	windres -i $(NAME).rc -o $(NAME)_res.o
clean:
	$(RM) $(PROG) *.$(O)
