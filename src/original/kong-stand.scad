include <../../lib/gridfinity-rebuilt-utility.scad>

gridfinity_thickness = 3;
ring_thickness = 2;

kong_xl_top_ring_inner = 12;
kong_xl_top_ring_height = 15.5;

kong_xl_first_ring_inner = 31.5;
kong_xl_first_ring_height = 35.5;

kong_xl_upper_ring_inner = 43;
kong_xl_upper_ring_height = 95;



module ring(inner_radius) {
    difference() {
        circle(inner_radius + ring_thickness);
        circle(inner_radius);
    }
}

// color("green") {
//     // gridfinityInit(2, 2, height(6), 0, 42)
//     // gridfinityBase(2, 2, 42, 0, 0, 1, only_corners=true);
//     linear_extrude(3) square([42*2, 42*2], center=true);
//     }
// }

color("tan") linear_extrude(3) square([42*2, 42*2], center=true);

translate([0, 0, gridfinity_thickness]) color("red")    linear_extrude(5)   ring(kong_xl_top_ring_inner);
translate([0,0, gridfinity_thickness+kong_xl_top_ring_height+kong_xl_first_ring_height]) color("blue")   linear_extrude(5)   ring(kong_xl_first_ring_inner);
translate([0,0, gridfinity_thickness+kong_xl_top_ring_height+kong_xl_upper_ring_height]) color("purple") linear_extrude(5)   ring(kong_xl_upper_ring_inner);


// color("pink") translate([0, kong_xl_first_ring_inner, gridfinity_thickness]) linear_extrude(height = gridfinity_thickness+kong_xl_top_ring_height+kong_xl_first_ring_height, convexity = 10, twist = 360) translate([5, 0, 0]) circle(r = 1.5);