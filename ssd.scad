
module ssd(h){

    difference(){

        translate([5,5]){
            linear_extrude(h){
                minkowski(){
                    square([59.85, 90.45]);
                    circle(5);
                }
            }
        }

        translate([12,-1,-1])
            cube([33.69, 3.25, 6]);

    }

}
