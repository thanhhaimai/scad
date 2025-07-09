// Chair Stop

eps = 0.001;
eps2 = eps * 2;
$fa = 1.0;
$fs = 0.1;

gap_r = 7;
outter_r = 20;
gap_y = 2;
latch_w = 0.5;
item_h = 50;

difference() {
  // Main
  translate([0, gap_y + gap_r, 0])
    cylinder(h=item_h, r=outter_r);

  // hole and cut
  union() {
    // inside hole
    color("red") {
      translate([0, gap_y + gap_r, -eps])
        cylinder(h=item_h + eps2, r=gap_r);

      gap_x = -(gap_r - latch_w);
      translate([gap_x, 0, -eps])
        cube([(gap_r - latch_w) * 2, gap_r, item_h + eps2]);
    }

    // Cut
    color("blue") {
      cut_d = outter_r - (gap_y + gap_r);
      cut_w = outter_r * 2;
      cut_y = -cut_w / 2 - eps;
      translate([cut_y, -cut_d + eps, -eps])
        cube([cut_w, cut_d, item_h + eps2]);
    }
  }
}
