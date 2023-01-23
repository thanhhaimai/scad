// Stair Gate Latch Bottom V2

eps = 0.002;
$fa = 1.0;
$fs = 0.1;

thickness = 4;

module main_hook(inner_r, outter_r, main_hook_h, main_hook_arm_h) {

  difference() {
    union() {
      translate([outter_r, outter_r, 0])
        cylinder(h=main_hook_h, r=outter_r);
      translate([0, outter_r, 0])
        cube([thickness, inner_r + 1, main_hook_h + 2 * eps]);
    }
    translate([outter_r, outter_r, -eps])
      cylinder(h=main_hook_h + 2 * eps, r=inner_r);
    translate([thickness - eps, outter_r, -eps])
      cube([outter_r + thickness, outter_r + eps, main_hook_h + 2 * eps]);
  }
}

// Base
union() {
  // Latch
  latch_gap_w = 50 - thickness;
  latch_gap_d = 12 + 0.1;
  latch_w = latch_gap_w + 2 * thickness;
  latch_d = latch_gap_d + 2 * thickness;
  latch_h = 30;
  difference() {
    cube([latch_w, latch_d, latch_h]);
    translate([thickness, thickness, -eps])
      cube([latch_gap_w + thickness + eps, latch_gap_d, latch_h + 2 * eps]);
  }

  arm_d = 35;
  arm_x = 50;
  arm_y = -arm_d;
  translate([arm_x, arm_y, 0])
    cube([thickness, arm_d, latch_h]);

  inner_r = 8;
  outter_r = inner_r + thickness;

  main_hook_x = arm_x;
  main_hook_y = arm_y - outter_r;
  main_hook_arm_h = latch_h;
  main_hook_h = main_hook_arm_h;

  translate([main_hook_x, main_hook_y, 0])
    main_hook(inner_r, outter_r, main_hook_h, main_hook_arm_h);
}