// Stair Gate Latch

eps = 0.001;
$fa = 1.0;
$fs = 0.1;

item_w = 21;
item_h = 6;
item_d = 15.5;

hole_radius = 9/2;
insert_origin_x = item_w - (hole_radius + 3);
insert_origin_y = item_d / 2;
insert_radius = 4.5/2;

// Main
difference() {
  union () {
    cube([item_w, item_d, item_h]);
  }
  translate([insert_origin_x, insert_origin_y, -eps])
    cylinder(h=item_h + 2 * eps, r=insert_radius);

}
