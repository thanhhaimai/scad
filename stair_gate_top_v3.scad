// Stair Gate Latch Bottom V3

eps = 0.002;
$fa = 1.0;
$fs = 0.1;

thickness = 4;

base_d = thickness;
base_w = 72;
base_h = 55.5;

plate_d = 33;
plate_h = base_h;
plate_w = thickness;

latch_x = base_w - 55 - 2 * thickness;
latch_d = 8.5;
latch_w = thickness;
latch_h = base_h;

base_hook_d = 2;
base_hook_w = 3 + thickness;
base_hook_h = base_h;

main_hook_inner_r = 8;
main_hook_outter_r = main_hook_inner_r  + thickness;
main_hook_w = thickness;
main_hook_d = 30;
main_hook_h = base_h;

hole_radius = 3.5/2;
hole_origin_y = plate_d/2;
hole_origin_z = plate_h/2;

module main_hook(inner_r, outter_r, main_hook_h, main_hook_arm_h) {
  difference() {
    union() {
      translate([outter_r, outter_r, 0])
        cylinder(h=main_hook_h, r=outter_r);
      translate([0, outter_r, 0])
        cube([thickness, inner_r + 1, main_hook_h + 2 * eps]);
    }
    translate([outter_r, outter_r, -eps])
      color("red") cylinder(h=main_hook_h + 2 * eps, r=inner_r);
    translate([thickness - eps, outter_r, -eps])
      color("red") cube([outter_r + thickness, outter_r + eps, main_hook_h + 2 * eps]);
  }
}

// Main
difference() {
  union () {
    cube([base_w, base_d, base_h]);
    translate([base_w - plate_w, base_d - eps, 0])
      color("green") cube([plate_w, plate_d, plate_h]);
    translate([latch_x, base_d - eps, 0])
      color("green") cube([latch_w, latch_d + eps, latch_h]);
    translate([latch_x, base_d + latch_d -eps, 0])
      color("blue") cube([base_hook_w, base_hook_d, base_hook_h]);
    translate([0, -main_hook_d, 0])
      color("green") cube([main_hook_w, main_hook_d + eps, latch_h]);
    translate([thickness, -main_hook_d - main_hook_outter_r, 0])
      mirror([1, 0 ,0])
        color("blue") main_hook(main_hook_inner_r, main_hook_outter_r, main_hook_h, main_hook_h);
  }
  translate([base_w - plate_w - eps, base_d + hole_origin_y, hole_origin_z])
    rotate([0, 90, 0])
      color("red") cylinder(h=plate_w + 2 * eps, r=hole_radius);
}
