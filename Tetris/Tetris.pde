int  i, w, h, type, x, unit;
String myString = " Daddy es un pedorro"; 
int [] level = new int[10] ;
ArrayList<Shape> shapes = new ArrayList<Shape>();
color bck = color(217, 255, 245);
boolean playing;
boolean[][] mat;

 void setup(){
  fullScreen();
  background(217, 255, 245);
  w = width;
  h = height;
  unit = w/30;
  playing = true;
  mat = new boolean[10][12];
  
  for (i=0;i<10;i++){
     level[i] = 0;
  }
 
 } // End of setup()

 void draw(){
   if(playing){
     background(bck);
     textSize(48);
     color(255,0,0);
     text(myString, 100,40);

     fill(36, 36, 79); 
     rect(w/3,9*h/10,w/3, 10);
     rect(w/3-11,h/10,10, 8*h/10+10);
     rect(2*w/3+1,h/10,10, 8*h/10+10);
     if(shapes.size()==0) {
       type = (int)random(1,3);
       switch(type){
         case 1: shapes.add(new Square()); 
                 break;
         case 2: shapes.add(new Rectangle()); 
                 break;               
       } // End of switch    
     } // End of if(shapes.size()==0)
     else {    
          if (!shapes.get(shapes.size()-1).getBottom() && shapes.get(shapes.size()-1).getMoving()){  
              for (i=0; i<shapes.size()-1;i++) shapes.get(i).render();
              shapes.get(shapes.size()-1).update();
              shapes.get(shapes.size()-1).render();
          } // End of if (!shapes.get(shapes.size()-1).getBottom() && ...
          else{ 
             if(shapes.get(shapes.size()-1).getY()-shapes.get(shapes.size()-1).getH()<= (9*h/10 - 12*unit)) playing =false;
               else{
                  type = (int)random(1,3);
                  switch(type){
                     case 1: shapes.add(new Square()); 
                             break;
                     case 2: shapes.add(new Rectangle()); 
                             break;               
                  }  // End of switch
                }   // End of else 
               }  // End of else    
      } // End of else
                   
   } // End of if(playing)
   else exit();
   stroke(3);
   line(w/4,(9*h/10 - 12*unit), 3*w/4, (9*h/10 - 12*unit));
 } // End of draw()
 
  void  keyPressed() {
   
     if (key == CODED) {   
      if (keyCode == RIGHT && !shapes.get(shapes.size()-1).getBottom() &&
             shapes.get(shapes.size()-1).getX()+shapes.get(shapes.size()-1).getW() < 2*w/3) {
               shapes.get(shapes.size()-1).moveR();
              
      }
      if (keyCode == LEFT && !shapes.get(shapes.size()-1).getBottom() &&
             shapes.get(shapes.size()-1).getX()> w/3){
                shapes.get(shapes.size()-1).moveL();
               
      }
       if (keyCode == DOWN && !shapes.get(shapes.size()-1).getBottom() ){
                shapes.get(shapes.size()-1).setDown();
      }
     }
  } // End of keyPressed()