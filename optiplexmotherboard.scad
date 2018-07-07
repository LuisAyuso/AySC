volt  = 2;
cpu_volt  = 20;
mobo_h = 1.57;


$fn = 25;


module mobo_contour(){
    linear_extrude(height=mobo_h)
        polygon(points=[[0,0],[220,0],[220,186],[146,186],[146,205],[0,205]]);

}

psu_bolt = [220-49,186-24];
bolts =  [[9,32], [9,205-6], 
          [0+105,205-9], [220-13,0+8],
          [220-7,186-24], [220-49,186-24], psu_bolt];
cpu_bolts =  [[44,71],
              [44,149], 
              [220-101,71],
              [220-101,149]];

module mobo(){

    difference( ) {
         
        mobo_contour();
        
        for (pos = bolts){
            translate(pos) 
                cylinder(  r=volt, h=100, center=true);
        }
        
        for (pos = cpu_bolts){
            translate(pos) 
                cylinder(  r=volt, h=100, center=true);
        }
    }
}
