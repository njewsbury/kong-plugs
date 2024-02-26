include <../lib/knurledFinishLib.scad>

$fn=20;

/**
    [ Kong Toy Plug ]

    * Note: The JSON file contains parameter sets for different Kong toys.

**/

/* [ Toy Parameter Settings ] */

param_set = "L"; //[::string] "S", "M", "L", "XL"
core_diameter = 9.5; //[::non-negative float]
wall_thickness = 11; //[::non-negative float]


/* [ Refined Settings ] */

handle_radius = 10; //[::non-negative float]
handle_length = 14; //[::non-negative float]

module kong_plug() {
    /**
        [ PLUG HANDLE ]
        This is the handle that will be used to pull the plug out of the Kong toy.

        @param handle_length the length of the handle
        @param handle_radius the radius of the handle, should be larger than the shaft.
    **/
    color("#BE8381") {
        // linear_extrude(handle_length) {
        //     circle(r=handle_radius);
        // }
        knurled_cyl(handle_length, handle_radius*2, 5, 5, 1.75, 1, 30);
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
        difference() {
        translate([0, 0, handle_length]) {
            linear_extrude(wall_thickness) {
                circle(r=core_radius);
            }
        }

        translate([0, 0, handle_length + wall_thickness - 1]) {
            linear_extrude(2) {
                text(param_set, size = 4, halign = "center", valign = "center");
            }
        }
        }
    }

    /**
        [ PLUG TIP ]

        This is the tip of the plug, it is used to create a seal with the rubber wall.
        The tip size is based on the shaft radius. It will be slightly larger.
    **/
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

kong_plug();





// linear_extrude(height = 10, center = true, convexity = 10, twist = 100) {
//     translate([2, 0, 0]) {
//         square([5, 5], center = true);
//     }
// }