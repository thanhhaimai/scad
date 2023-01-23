// Chair Stop

eps = 0.001;
eps2 = eps * 2;
$fa = 1.0;
$fs = 0.1;


thickness = 2;
gap_r = 7;
gap_d = thickness;
latch_w = 0.5;
guard_d = 15;

item_h = 50;
item_w = (gap_r + thickness) * 2;
item_d = gap_d + gap_r * 2 + thickness;


difference() {
  union() {
    cube([item_w, gap_d + gap_r + guard_d, item_h]);
    translate([gap_r + thickness, gap_d + gap_r + guard_d, 0])
      cylinder(h=item_h, r=gap_r + thickness);
  }
  // Gap
  color("red") {
    union() {
      translate([gap_r + thickness, gap_d + gap_r, -eps])
        cylinder(h=item_h + eps2, r=gap_r);
      translate([thickness + latch_w, -eps, -eps])
        cube([(gap_r - latch_w) * 2, gap_d + gap_r, item_h + eps2]);
    }
  }
}
