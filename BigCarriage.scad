$fs=0.01;

module Wrencher(){

    difference(){

        union(){
            linear_extrude( file = "HaDLogo.dxf", layer = "skull", height = 6, center = false, convexity = 10);
            linear_extrude( file = "HaDLogo.dxf", layer = "wrenches_a", height = 4, center = false, convexity = 10);

            linear_extrude( file = "HaDLogo.dxf", layer = "wrenches_b", height = 4, center = false, convexity = 10);  
            
        }

        translate([0,0,6]){
            linear_extrude( file = "HaDLogo.dxf", layer = "face", height = 4, center = true, convexity = 10);
        }
        
    }

}

module beltGroove(){
 
 difference(){   
     union(){
       
            translate([0,-2,3.5]){
             cube([7,12.5,2.5]);
             
             translate([0,12.5,0])   
             rotate([45,0,0])
                cube([7,7,2.5]); 
               
                
             for (i = [1:2:12]){ 
                rotate([0,90,0])
                translate([0,i,0])   
                    cylinder(d=1,h=7);
             
                 
             }
         }
         translate([-3,5,-0.1])
            boltHole();
         
         translate([10,5,-0.1])
            boltHole();
        
     }
      translate([0,-4,5])
         cube([8,20,10]);
    }
    
}

module hexagon(width, rad, height){
 hull(){
  
      translate([width/2-rad,0,0])
        cylinder(r=rad,h=height);
         
      rotate([0,0,60])
         translate([width/2-rad,0,0])
            cylinder(r=rad,h=height);   
        
      rotate([0,0,120])
         translate([width/2-rad,0,0])
            cylinder(r=rad,h=height);
         
      rotate([0,0,180])
         translate([width/2-rad,0,0])
            cylinder(r=rad,h=height);
         
      rotate([0,0,240])
         translate([width/2-rad,0,0])
            cylinder(r=rad,h=height);
         
      rotate([0,0,300])
         translate([width/2-rad,0,0])
            cylinder(r=rad,h=height);
    }
}

module boltHole(){
    union(){
        hexagon(7,0.25,2.5);
        translate([0,0,-2])
            cylinder(d=3.3, h=10);
        
    }    
    
}


module fanHoles(){
    
  for (i = [20:10:120]){
   translate([56,i,0])
        boltHole();
      
  }
    
}

module endstop(){
    
    
    translate([21.5,12.5,-0.1])
        boltHole();
    
    translate([40.5,12.5,-0.1])
        boltHole();
    
    translate([14.5,1.75,5])
    rotate([270,0,0])
    cylinder(d=4,h=13);
    
    translate([24,6.25,5])
    rotate([90,90,90])
    cylinder(d=4,h=15);
    
}

module clipHoles(){
  translate([5,20,-0.1])
        boltHole();
    
  translate([5,30,-0.1])
        boltHole();
}

module inductiveSensor(){

union(){
        difference(){
            cube([15,35,55]);

            translate([-1,16.5,40])
            rotate([0,90,0])
            cylinder(d=19,h=25);
            
            translate([0,0,10])
                cube([10,35,55]);
            
            translate([0,0,10])
            rotate([270,0,0])
            cylinder(d=20,h=35);   
        }
        

    }
    
    
    difference(){
        translate([-15,0,0])
        rotate([0,45,0])
        cube([40,5,40]);
        
        translate([15,0,0])
        cube([40,40,40]);
    
        translate([-15,0,-40])
        cube([80,40,40]);
        
    }
    
        difference(){
        translate([-15,30,0])
        rotate([0,45,0])
        cube([40,5,40]);
        
        translate([15,0,0])
        cube([40,40,40]);
    
        translate([-15,0,-40])
        cube([80,40,40]);
        
    }

}

module motorMountHoles(){
    

    boltHole(); 
    translate([0,0,7]) 
    cylinder(d=6,h=40);
    
    translate([-15,0,0])
    boltHole(); 
    translate([-15,0,7]) 
    cylinder(d=6,h=40);
    
    translate([-30,0,0])
    boltHole(); 
    translate([-30,0,7]) 
    cylinder(d=6,h=40);
    
    translate([-45,0,0])
    boltHole(); 
    translate([-45,0,7]) 
    cylinder(d=6,h=40);
    
    
    translate([0,60,0])
    boltHole(); 
    translate([0,60,7]) 
    cylinder(d=6,h=40);
    
    translate([-15,60,0])
    boltHole(); 
    translate([-15,60,7]) 
    cylinder(d=6,h=40);
    
    translate([-30,60,0])
    boltHole(); 
    translate([-30,60,7]) 
    cylinder(d=6,h=40);
    
    translate([-45,60,0])
    boltHole(); 
    translate([-45,60,7]) 
    cylinder(d=6,h=40);
     
 
}

module stepperHoles(){
        cylinder(d=23, h=10);
    
        translate([15.5,15.5,0])
            cylinder(d=3, h=10);
    
        translate([-15.5,15.5,0])
            cylinder(d=3, h=10);
    
        translate([15.5,-15.5,0])
            cylinder(d=3, h=10);
    
        translate([-15.5,-15.5,0])
            cylinder(d=3, h=10);
}

module directDriveAdapter(){
 difference(){
    
    translate([-50,-5,0])
    cube([40,70,25]); 
     
    translate([-30,30,15])
     stepperHoles();
   
    translate([0,0,-4])
    motorMountHoles();
     
     translate([-54,5,0])
        cube([60,50,22]);
     
 }
 

    
}

module dualExtrusionAdapter(){
 difference(){
    
    translate([-50,-5,0])
    cube([25,70,40]); 
     
   
    translate([0,0,-4])
    motorMountHoles();
     
     translate([-54,5,0])
        cube([60,50,25]);
     
 }
 

    
}

module basePlateFront(){
    
difference(){    
        hull(){
            translate([0,0,0])
            cylinder(d=4, h=5);
          
            translate([62,0,0])
            cylinder(d=4, h=5);
            
            translate([62,140,0])
            cylinder(d=4, h=5);
            
            translate([0,140,0])
            cylinder(d=4, h=5);
        }
        
        translate([3,3,-1])
            cylinder(d=5.25, h=7);
        
        translate([3,137,-1])
            cylinder(d=5.25, h=7);
        
        hull(){
            translate([59,137,-1])
                cylinder(d=5.25, h=7);
            translate([53,137,-1])
                cylinder(d=5.25, h=7);
        }
        hull(){
            translate([59,3,-1])
                cylinder(d=5.25, h=7);
            translate([53,3,-1])
                cylinder(d=5.25, h=7);     
        }
        
        translate([18,0,0.1])
            beltGroove();
        
        translate([42,140,0.1])
            rotate([0,0,180])
            beltGroove();
        
        clipHoles();
        
        translate([0,60,0])
        clipHoles();
        
        translate([55,55,-0.1])
            motorMountHoles();
        
        
    }
    
    translate([49,10,5])
    inductiveSensor();
}

module basePlateBack(){
    union(){    
    difference(){    
            hull(){
                translate([0,0,0])
                cylinder(d=4, h=5);
              
                translate([62,0,0])
                cylinder(d=4, h=5);
                
                translate([62,140,0])
                cylinder(d=4, h=5);
                
                translate([0,140,0])
                cylinder(d=4, h=5);
            }
            
            translate([3,3,-1])
                cylinder(d=5.25, h=7);
            
            translate([3,137,-1])
                cylinder(d=5.25, h=7);
            
            hull(){
                translate([59,137,-1])
                    cylinder(d=5.25, h=7);
                translate([53,137,-1])
                    cylinder(d=5.25, h=7);
            }
            hull(){
                translate([59,3,-1])
                    cylinder(d=5.25, h=7);
                translate([53,3,-1])
                    cylinder(d=5.25, h=7);     
            }
            
            translate([18,0,0.1])
                beltGroove();
            
            translate([42,140,0.1])
                rotate([0,0,180])
                beltGroove();
            
            translate([0,0,-0.1])
            fanHoles();
            
            translate([-10,105,0])
                endstop();
            
        
        }
    translate([70,20,5])
        scale([0.3,0.3,.3])
            rotate([0,0,90])
                Wrencher();
    }
}

translate([60,155,0])
directDriveAdapter();

//translate([120,155,0])
//dualExtrusionAdapter();

basePlateFront();

translate([70,0,0])
basePlateBack();

 

