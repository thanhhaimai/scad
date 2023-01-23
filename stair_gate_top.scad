// Stair Gate Latch

eps = 0.001;
$fa = 1.0;
$fs = 0.1;

item_h = 40;
item_d = 25;

// 12 + 0.1 tolerance
gap_width = 12.1;
thickness = 4;

latch_opening_width = 15;
inner_radius = (item_d - 2 * thickness) / 2;
outter_radius = item_d / 2;

item_w = 2 * thickness + gap_width + latch_opening_width + outter_radius;

// Main
difference() {
  latch_x = gap_width + 2 * thickness;
  cylinder_origin_x = latch_x + latch_opening_width;
  cylinder_origin_y = outter_radius;
  union () {
    cube([item_w - outter_radius, item_d, item_h]);
    translate([cylinder_origin_x, cylinder_origin_y, 0])
      cylinder(h=item_h, r=outter_radius);
  }
  translate([thickness, thickness, -eps])
    cube([gap_width, item_d, item_h + 2 * eps]);
  translate([latch_x, -eps, -eps])
    cube([latch_opening_width, item_d - thickness, item_h + 2 * eps]);
  translate([cylinder_origin_x, cylinder_origin_y, -eps])
    cylinder(h=item_h + 2 * eps, r=inner_radius);
}