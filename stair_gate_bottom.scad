// Stair Gate Latch Bottom

eps = 0.002;
$fa = 1.0;
$fs = 0.1;

thickness = 4;

// Latch
// +0.2 tolerance
latch_gap_w = 12 + 0.2;
latch_w = latch_gap_w + 2 * thickness;
latch_d = 25;
latch_h = 25;

difference() {
  cube([latch_w, latch_d, latch_h]);
  translate([thickness, thickness, -eps])
    cube([latch_gap_w, latch_d, latch_h + 2 * eps]);
}

// Arm
// Share wall
arm_x = latch_w - eps - thickness;

arm_gap_w = 35;
arm_w = arm_gap_w + 2 * thickness;
arm_d = latch_d;
arm_h = latch_h;

translate([arm_x, 0, 0]) {
  difference() {
    cube([arm_w, arm_d, arm_h]);
    translate([thickness, thickness, -eps])
      cube([arm_gap_w, arm_d, arm_h + 2 * eps]);
  }
}

// Hook
// Share wall
hook_x = arm_x + arm_w - thickness;
hook_y = latch_d - eps;

hook_gap_d = 12;
hook_gap_w = hook_gap_d;
hook_w = hook_gap_w + thickness;
hook_d = hook_gap_d + 2 * thickness;

hook_cut_h = latch_h - 5;
hook_h = latch_h + 15;
translate([hook_x, hook_y, 0]) {
  difference() {
    cube([hook_w, hook_d, hook_h]);
    translate([-eps, thickness, -eps])
      cube([hook_gap_w, hook_gap_d, hook_h + 2 * eps]);
    translate([-eps, thickness, -eps])
      cube([hook_gap_w + thickness + 2 * eps, hook_gap_d + thickness + eps, hook_cut_h]);
  }
}