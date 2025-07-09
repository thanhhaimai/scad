// Chair Stop

eps = 0.001;
eps2 = eps * 2;
$fa = 1.0;
$fs = 0.1;

// Height of the whole item
item_h = 50;

// Radius of the inner hole
gap_r = 7;

// Radius of the outter edge
outter_r = 20;

// Move the origin of both inner hole and outter cylinder in y direction
gap_y = 2;

// How much thinner is the gap compared to the inner hole
// Increase to make the latch smaller
latch_w = 0.5;

// Radius for rounded edges
round_r = 1; 

difference() {
  // Main - cylinder with rounded edges using minkowski
  // NOTE: minkowski add 2 * round_r to the height
  translate([0, gap_y + gap_r, round_r])
    minkowski() {
      cylinder(h=item_h - round_r * 2, r=outter_r - round_r);
      sphere(r=round_r);
    }

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
