// Stair Gate Latch

eps = 0.001;
$fa = 1.0;
$fs = 0.1;

plate_w = 33;
plate_h = 55;
plate_d = 4;

adapter_w = 33;
adapter_h = 65;
adapter_d = 14;

connector_w = plate_w;
connector_h = 4;
connector_d = adapter_d + plate_d;

hole_radius = 3.5/2;
hole_origin_x = plate_w/2;
hole_origin_y = 0;
hole_origin_z = plate_h/2;

insert_radius = 4.5/2;
insert_offset = 9.5;
insert_origin_x = adapter_w - insert_offset;
insert_origin_y = plate_d;

// Main
difference() {
  union () {
    cube([plate_w, plate_d, plate_h]);
    translate([0, 0, -connector_h + eps])
      color("green") cube([connector_w, connector_d, connector_h]);
    translate([0, plate_d, -connector_h -adapter_h + eps])
      cube([adapter_w, adapter_d, adapter_h]);
  }
  translate([hole_origin_x, hole_origin_y - eps, hole_origin_z])
    rotate([-90, 0, 0])
      color("red") cylinder(h=plate_d + 2 * eps, r=hole_radius);
  translate([adapter_w - insert_offset, insert_origin_y - eps, -connector_h -insert_offset])
    rotate([-90, 0, 0])
      color("red") cylinder(h=adapter_d + 2 * eps, r=insert_radius);
  translate([adapter_w - insert_offset, insert_origin_y - eps, -connector_h -adapter_h + insert_offset])
    rotate([-90, 0, 0])
      color("red") cylinder(h=adapter_d + 2 * eps, r=insert_radius);
}
