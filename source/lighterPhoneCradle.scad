
//TO_DO:
//make front side thicker;




dock_base_Thickness = -2;





module phoneCradle() {
	import("htc_rezound_cradle.stl");
}


module lighterPlug() {
	
	difference() {
		translate([2,-31.5,-11.5]) {
			//rotate([270,90,0]) {
				import("lighterPhoneCradleShortPlug.stl");
			//}
		}
		translate([-20,-15,-10]) {
			cube([50,35,50]);
		}
	}	
}


	
			
	





module cradleBackSupport() {
	hull() {
		translate([64.39,9.8,25.04]) {
			cube([1,1,1]);
		}
		translate([-65.43,9.8,25.04]) {
			cube([1,1,1]);
		}
		translate([-65.43,9.8,dock_base_Thickness]) {
			cube([1,1,1]);
		}
		translate([-10,9.8,25.04]) {
			cube([1,1.5,1]);
		}
	}






	hull() {
		translate([20,13.5,27]) {
			rotate([90,0,0]) {
				cylinder(r1=15,r2=17,h=7);
			}
		}
		translate([-25.44,9.8,50.44]) {
			cube([90.83,1,1]);
		}

		translate([64.39,9.8,dock_base_Thickness]) {
			cube([1,1,50.44]);
		}	

		translate([-50.8,9.8,25.04]) {
			cube([1,1,1]);
		}
		translate([-65.43,9.8,dock_base_Thickness]) {
			cube([1,1,1]);
		}


		translate([0,13.5,27]) {
			rotate([90,0,0]) {
				cylinder(r1=15,r2=17,h=3);
			}
		}
	}


	
		
		difference() {	
			translate([0,13.5,27]) {
				rotate([90,0,0]) {
					cylinder(r1=15,r2=17,h=7);	
				}
			}
		}
	




union() {
	union() {
		translate([67,-9.9,dock_base_Thickness]) {
			cube([3,20.7,51.43+(dock_base_Thickness*-1)]);
		}
		
		translate([58.45,-11.5,dock_base_Thickness]) {
			cube([11.55,3,51.43+(dock_base_Thickness*-1)]);
		}
		
		translate([65,7.9,dock_base_Thickness]) {
			cube([5,2.9,51.43+(dock_base_Thickness*-1)]);
		}
	}
	
	union() {
		difference() {
			translate([-70,-9.9,dock_base_Thickness]) {
				cube([3.33,20.7,30.04+(dock_base_Thickness*-1)]);
			}
			translate([-70.5,-7.2,3.2]) {
				cube([8,10.5,18.4]);
			}
		}
	
		translate([-70,-11.5,dock_base_Thickness]) {
			cube([11.65,4.35,30.04+(dock_base_Thickness*-1)]);
		}
		translate([-70,6.45,dock_base_Thickness]) {
			cube([25,4.4,30.04+(dock_base_Thickness*-1)]);
		}
		rotate([0,0,45]) {
			translate([-46.8,48.1,25.63]) {
				cube([8.5,4,4.4]);
			}
		}
	}
	
	translate([-58.45,-11.5,dock_base_Thickness]) {
		cube([121.55,3,3.2+(dock_base_Thickness*-1)]);
	}
}


}



module cradleBottomCutShell() {
	difference() {
		rotate([0,0,50]) {
			phoneCradle();
		}
		translate([-68.08,-12,dock_base_Thickness*-1]) {
			cube([136.16,24,54.25]);
		}
	}
}



module cradleBottomCutFill() {
	difference() {
		translate([-63,-7.20,0]) {
			cube([126.03,11.15,dock_base_Thickness*-1]);
		}
		cradleBottomCutShell();
	}
	translate([-67.947,-7.20,3]) {
		cube([3,11.15,dock_base_Thickness*-1]);
	}
	translate([-63,-9.93,3]) {
			cube([128.03,2,dock_base_Thickness*-1]);
	}
}




module cradleBottomCut() {
	difference() {
		union() {
			cradleBottomCutFill();
			cradleBottomCutShell();
		}
		cradleBottomCut();
		translate([38.75,-4.66,-1]) {
			cube([12.66,8.3,dock_base_Thickness*-2]);
		}

		
	}
}













module rezoundCarDock(baseThick) {
	union() {	
		translate([5,-13.5,0]) {
			lighterPlug();
		}
		difference() {
			rotate([0,0,50]) {
				phoneCradle();
			}
			translate([38.75,-4.66,0]) {
				cube([12.66,8.3,dock_base_Thickness*-2]);
			}
		}		
		translate([0,0,baseThick]) {
			cradleBottomCut();
		}
		translate([0,13.5,27]) {
			rotate([90,0,0]) {
				cylinder(r=15,h=3);					
			}
		}
		cradleBackSupport();
	}
}






rezoundCarDock(dock_base_Thickness);



















