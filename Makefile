all: devkit_bottomup.png devkit_bottomup.stl
	geeqie

run:

dbg:
	rsync --archive --verbose * littlun:/var/www/emdete.de/l5/.

devkit_bottomup.png: devkit_bottomup.scad Makefile
	openscad --camera -200,200,150,0,0,0 --imgsize 1440,720 --colorscheme Solarized -o $@ $<

devkit_bottomup.stl: devkit_bottomup.scad
	openscad -o $@ $<
