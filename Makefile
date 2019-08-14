# see https://www.openscad.org/cheatsheet/index.html
OSFLAGS=--imgsize 1440,720 --colorscheme Solarized

all: devkit_bottomup_bottom.png devkit_bottomup_right.png devkit_bottomup_front.png devkit_bottomup.png devkit_bottomup.stl

run: all
	geeqie

dbg: all
	rsync --archive --verbose * littlun:/var/www/emdete.de/l5/.

devkit_bottomup.stl: devkit_bottomup.scad
	openscad -o $@ $<

devkit_bottomup.png: devkit_bottomup.scad Makefile
	openscad --camera -200,200,150,0,0,0 $(OSFLAGS) -o $@ $<

devkit_bottomup_front.png: devkit_bottomup.scad Makefile
	openscad --camera 0,0,15,180,0,0,550 $(OSFLAGS) --projection ortho -o $@ $<

devkit_bottomup_right.png: devkit_bottomup.scad Makefile
	openscad --camera 0,0,15,180,90,0,550 $(OSFLAGS) --projection ortho -o $@ $<

devkit_bottomup_bottom.png: devkit_bottomup.scad Makefile
	openscad --camera 0,0,15,90,0,0,550 $(OSFLAGS) --projection ortho -o $@ $<

