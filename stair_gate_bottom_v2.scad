// Stair Gate Latch Bottom V2

include <lib/roundedcube.scad>;

eps = 0.002;
$fa = 1.0;
$fs = 0.1;

thickness = 4;
rounded_radius = 2;

module hook(w, d, h) {
  // Left hook
  p0 = [0, 0];
  p1 = [0, d];
  p2 = [w, 0];

  linear_extrude(height=h)
    polygon([p0, p1, p2]);
}

// Base
union() {
  // Latch
  latch_gap_w = 257;
  latch_gap_d = 12 + 0.1;
  latch_w = latch_gap_w + 2 * thickness;
  latch_d = latch_gap_d + 2 * thickness;
  latch_h = 25;
  difference() {
    roundedcube([latch_w, latch_d, latch_h], radius=rounded_radius, apply_to="z");
    color("red")
      translate([thickness, thickness, -eps])
        cube([latch_gap_w, latch_d, latch_h + 2 * eps]);
  }

  // Left hook
  hook_w = 3;
  left_hook_y = latch_gap_d + thickness - eps;

  translate([thickness - eps, left_hook_y, 0])
    hook(w=hook_w + eps, d=thickness, h=latch_h);

  // Right hook
  right_hook_x = latch_gap_w + thickness - hook_w;
  right_hook_y = latch_gap_d + thickness - eps;
  translate([right_hook_x + eps, right_hook_y, 0])
    mirror(v= [1, 0, 0])
      translate([-hook_w, 0, 0])
        hook(w=hook_w + eps, d=thickness, h=latch_h);

  // Arm
  arm_gap_d = 23;
  arm_d = 15;
  arm_h = latch_h + 20;
  arm_x = 50;
  arm_y = -arm_gap_d - arm_d;
  translate([arm_x, -arm_gap_d, 0])
    cube([thickness, arm_gap_d + eps, latch_h]);
  translate([arm_x, -arm_gap_d -rounded_radius , 0])
    cube([thickness, rounded_radius + eps, arm_h]);
  translate([arm_x, arm_y, 0]) 
    roundedcube([thickness, arm_d + eps, arm_h], radius=rounded_radius, apply_to="z");

  // Main Hook
  inner_r = 9;
  outter_r = inner_r + thickness;
  main_hook_h = 10;

  main_hook_x = arm_x + outter_r;
  main_hook_y = arm_y;
  main_hook_z = arm_h;

  translate([main_hook_x, main_hook_y, main_hook_z])
    difference () {
      union () {
        cylinder(h=main_hook_h, r=outter_r);
        translate([-outter_r, 0, 0])
          cube([thickness, arm_d, main_hook_h]);
      }
      color("red") {
        translate([0, 0, -eps])
          cylinder(h=main_hook_h + 2 * eps, r=inner_r);
        translate([-inner_r, 0, -eps])
          cube([2 * inner_r + thickness + eps, outter_r + eps, main_hook_h + 2 * eps]);
      }
    }
}