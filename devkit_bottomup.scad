/*
	Upside-down aproach for a devkit case: The devkit is put in from behind, display first. So all components (batteryholder, cam, ...) are freely reachable and sensitive parts (like TS-connector) are covered. And the processor heat can be taken care of as its just open - a fan can be mounted.

	The idea is to plug the devkit in (with the audio connector first) and put some hot glue to the corners to fix it.
*/
$fn=40;
border=5;
inf=99;
difference() {
	union() {
		// The whole case outside:
		cube([180+2*border, 90+2*border, 30]);
		// The bumpers
		if (0) {
			translate([border/2, border/2, border/2]) sphere(border);
			translate([border/2, border/2, 30-border/2]) sphere(border);

			translate([border/2, 90+border*1.5, border/2]) sphere(border);
			translate([border/2, 90+border*1.5, 30-border/2]) sphere(border);

			translate([180+border*1.5, border/2, border/2]) sphere(border);
			translate([180+border*1.5, border/2, 30-border/2]) sphere(border);

			translate([180+border*1.5, 90+border*1.5, border/2]) sphere(border);
			translate([180+border*1.5, 90+border*1.5, 30-border/2]) sphere(border);
		}
	}
	// The room occupied by the devkit:
	union() {
		// The display:
		translate([17+border, 10+border, -.5]) union(){
			translate([0, 6, 0]) cube([147, 58, inf]);
			translate([6, 0, 0]) cube([135, 70, inf]);
			translate([6, 6, 0]) cylinder(inf, 6, 6);
			translate([6, 64, 0]) cylinder(inf, 6, 6);
			translate([141, 6, 0]) cylinder(inf, 6, 6);
			translate([141, 64, 0]) cylinder(inf, 6, 6);
		}
		// Room for the PCB and components:
		translate([border, border, 2]) cube([180, 90, inf]);
		// The openings:
		// Speaker:
		translate([border+171, border+47, -.5]) cylinder(10, 3, 3);
		translate([border+171, border+55, -.5]) cylinder(10, 3, 3);
		// Microphone:
		translate([border+11, border+43, -.5]) cylinder(10, 3, 3);
		// Killswitch bt
		translate([border+95, 2, -.5]) cylinder(10, 4, 4);
		// Killswitch wifi
		translate([border+85, 2, -.5]) cylinder(10, 4, 4);
		// Killswitch mic/cam
		translate([border+75, 2, -.5]) cylinder(10, 4, 4);
		// Switch bootmode:
		translate([border+58, 2, -.5]) cylinder(10, 4, 4);
		// Button reset:
		translate([border+55, 2, -.5]) cylinder(10, 4, 4);
		// Button power:
		translate([border+118, 90+border*2-2, -.5]) cylinder(10, 4, 4);
		// Button speaker up:
		translate([border+98, 90+border*2-2, -.5]) cylinder(10, 4, 4);
		// Button speaker down:
		translate([border+82, 90+border*2-2, -.5]) cylinder(10, 4, 4);
		// SIM:
		translate([135, 90+border-.5, 6]) cube([15, border+1, 3]);
		// Securecard:
		
		// SD Card:
		translate([-.5, 66, 6]) cube([border+1, 12, 4]);
		// USB-C:
		translate([-.5, 54, 6]) cube([border+1, 11, 7]);
		// HDMI:
		
		// Ethernet:
		translate([-.5, 25, 6]) cube([border+1, 14, 12]);
		// Headphone:
		translate([-.5, 15, 9]) rotate([0, 90, 0]) cylinder(border+1, 4, 4);
	}
}
// The pillars, corners:
translate([border, border, 0]) cylinder(6, border, border);
translate([180+border, border, 0]) cylinder(6, border, border);
translate([border, 90+border, 0]) cylinder(6, border, border);
translate([180+border, 90+border, 0]) cylinder(6, border, border);
// The pillars, additional:
translate([110+border, border, 0]) cylinder(6, border, border);
translate([70+border, 90+border, 0]) cylinder(6, border, border);


