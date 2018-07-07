include <optiplexmotherboard.scad>
include <ssd.scad>

$fn = 20;

board_offset = [3, 0];
blade_thickness = 3;
standof_h = 5;

// the blade itself
difference(){
    

    linear_extrude(height=blade_thickness)
        square([235,248]);

    hull(){
        translate([220,215])
            cylinder(r=5, h=15, center=true);
        translate([220,235])
            cylinder(r=5, h=15, center=true);
        translate([100,215])
            cylinder(r=5, h=15, center=true);          
        translate([125,235])
            cylinder(r=5, h=15, center=true);
    }

    translate([0,0,-1])
        linear_extrude(height=blade_thickness+10)
            polygon([[-1,210], [70,210], [135,260], [-1,260]]);

    hull(){
        for(bolt = cpu_bolts){
            translate (bolt+ board_offset)
                cylinder (r=15, h=15, center = true);
        }
    }
    
    for(bolt = bolts){
        translate (bolt+ board_offset)
           cylinder (r=1.5, h=15, center = true);
    }
    
    hull(){
        translate ([155, 190])
            cylinder (r=5, h=15, center = true);
        translate ([155, 200])
            cylinder (r=5, h=15, center = true);

    }
}

translate([238,0,0])
rotate([0,270,0])
linear_extrude(height=blade_thickness)
    square([40,160]);


// this is the motheraboard with the standofs
translate (board_offset)
rotate([180,0,0])
translate ([0,-210]){
    
    // mobo
    translate ([0,0,standof_h])
  %      mobo();
    
    // standofss
    for(bolt = bolts)
        translate(bolt)
   %         cylinder(r=2.5, h=standof_h);
    
    translate ([0,0, standof_h + mobo_h])
    translate (psu_bolt)
    %        cylinder(r=2.5, h=10);
    
    //psu    
    translate ([220-55, 0]){
        y = 186-30;    
        translate ([0,0, standof_h + mobo_h + 10])
            % cube ([65,y,35]);
    }
}

//hdd
translate ([150,180, -0.5])
    rotate([0,180,180])
     %   ssd(h=7);   