
$fn=20;

/* [ Quick Presents ] */
quick_presents = 0; // [0: Custom Parameters, 1: Kong Large Red, 2: Kong XL Red]

/* [ Refined Settings ] */

core_diameter = 10.5; //[::non-negative float]

wall_thickness = 11; //[::non-negative float]

handle_radius = core_diameter; //[::non-negative float]
handle_length = 7; //[::non-negative float]

/*
cylinder(h=15, r=10);
translate([0, 0, 15-0.01]) {
    cylinder(h=11, r=5);

    translate([0, 0, 11-0.01]) {
        cylinder(h=2, r=6);
    }
}
*/
kong_plug();

module kong_plug() {
    /**
        [ PLUG HANDLE ]
        This is the handle that will be used to pull the plug out of the Kong toy.

        @param handle_length the length of the handle
        @param handle_radius the radius of the handle, should be larger than the shaft.
    **/
    color("#BE8381") {
        linear_extrude(handle_length) {
            circle(r=handle_radius);
        }
    }
    /**
        [ PLUG SHAFT ]
        This is the shaft that will be inserted into the Kong toy.
        The shaft needs to be "roughly" the same diameter as the hole at the top of the kong, but slightly larger
        to form a seal.
        The shaft length should match the rubber wall thickness, each kong toy has a different thickness.

        @param wall_thickness the thickness of the rubber wall
        @param core_diameter the diameter of the top hole, slightly stretched.
    **/
    core_radius = core_diameter / 2.0;
    color("#81BE83") {
        translate([0, 0, handle_length]) {
            linear_extrude(wall_thickness) {
                circle(r=core_radius);
            }
        }
    }
    color("#A281BE") {
        translate([0, 0, handle_length + wall_thickness]) {
            rotate_extrude() {
                translate([core_radius, 0, 0]) {
                    circle(r=core_radius/4);
                }
            }
        }

    }

}

// module shaft(handle_height, thickness, radius) {
//     total_height = handle_height + thickness;

//     cylinder(h=total_height, r=radius);

// }