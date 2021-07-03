
int i,j,w,h,unit,contH,offsetY;
boolean playing;
boolean[][] container = new boolean[17][10];
ArrayList<Shape> shapes = new ArrayList<Shape>();
Shape shape;
color bck = color(217, 255, 245);

// Temporary Variables
int initContX, finalContX;

void setup(){
 fullScreen();
  background(bck);
  w = width;
  h = height;
  unit = w/30;
  contH = 16*unit;
  offsetY = (h-(8*w/15))/2;
  playing = true;  
  for(j=0;j<10;j++){
    for(i=0;i<16;i++){
      container[i][j] = false;
    }
     container[16][j] = true; 
  } 
  shape = new Shape((int)random(1,6),(w/3 + (unit * (int)random(0,8))),offsetY,unit);
  //shapes.add(new Shape((int)random(1,6),2,h/10,unit));
  playing = false;
  initContX = shape.contX;
  finalContX = -1;
} // End of setup()


void draw(){
  
  background(bck);
  drawContainer();
  
  if(playing)shape.update();
  shape.render();
  for(i=0;i<shapes.size();i++){
    //shapes.get(i).update();
    shapes.get(i).render();
  }
  //drawLine();  
      textSize(24);
    fill(255,0,0);
     text("contY: "+shape.contY+"   contX: "+shape.contX, 100,40);
     text("initial contX: "+initContX+"  final contX:  "+ finalContX,100,70);
     text("Screen Width: "+w+" speed: "+shape.incY,100,100);
     for(i=0;i<shape.borderX.length;i++){
       text("borderX["+i+"]= "+shape.borderX[i]+"  borderY["+i+"]= "+shape.borderY[i],100,140+i*40);
     }
  
  if(!shape.desc){
    finalContX = shape.contX;
    shapes.add(shape);
    shape = new Shape((int)random(1,6),(w/3 + (unit * (int)random(0,8))),offsetY,unit);
     
    playing = false;
  }
 
     drawGrid();
} // End of draw()


 void  keyPressed() {
   
    if (key == CODED) { 
      if(keyCode == RIGHT) shape.moveR();
      
      if(keyCode == LEFT){
        shape.moveL();
      }
      if (keyCode == SHIFT){
         shape.rotateRight();
         //shapes.get(shapes.size()-1).rotateRight();
      }
      
      if(keyCode == DOWN) shape.incY = unit/5;
    } 
     if(keyCode == ENTER) playing = !playing;
    
 }  // End of keyPressed()

 void drawContainer(){
  fill(36, 36, 79); 
  rect(w/3,offsetY+contH,w/3,10);  // bottom horizontal
  rect(w/3-11,offsetY,10, contH+10); //left vertical
  rect(2*w/3+1,offsetY,10, contH+10);  // right vertical
  //rect(w/3,9*h/10,w/3, 10);
  //rect(w/3-11,h/10,10, 8*h/10+10);
  //rect(2*w/3+1,h/10,10, 8*h/10+10); 
 }
 
 void drawLine(){
    stroke(3);
    line(w/4,(9*h/10 - 12*unit-5), 3*w/4, (9*h/10 - 12*unit-5));
 }  
 
 void drawGrid(){
   int i,j;
   textSize(20);
   fill(0,0,255);
   stroke(3);
   for(j=1;j<10;j++){
     line(j*unit+w/3,offsetY,j*unit+w/3,offsetY+contH);
     text((j-1),j*unit-40+w/3,offsetY+contH+35);
   }
   for(i=0;i<16;i++){
      line(w/3,offsetY+i*unit,2*w/3,offsetY+i*unit);
      text(i,w/3-35,offsetY+i*unit+unit/2);
      text(i,2*w/3+25,offsetY+i*unit+unit/2);
   }
 }
   

//int  i, w, h, type, x, unit;
//String myString = " Daddy es un pedorro"; 
//int [] level = new int[10] ;
//ArrayList<Shape> shapes = new ArrayList<Shape>();
//color bck = color(217, 255, 245);
//boolean playing;
//boolean[][] mat;

// void setup(){
//  fullScreen();
//  background(217, 255, 245);
//  w = width;
//  h = height;
//  unit = w/30;
//  playing = true;
//  mat = new boolean[10][12];
  
//  for (i=0;i<10;i++){
//     level[i] = 0;
//  }
 
// } // End of setup()

// void draw(){
//   if(playing){
//     background(bck);
//     textSize(48);
//     color(255,0,0);
//     text(myString, 100,40);

//     fill(36, 36, 79); 
//     rect(w/3,9*h/10,w/3, 10);
//     rect(w/3-11,h/10,10, 8*h/10+10);
//     rect(2*w/3+1,h/10,10, 8*h/10+10);
//     if(shapes.size()==0) {
//       type = (int)random(1,3);
//       switch(type){
//         case 1: shapes.add(new Square()); 
//                 break;
//         case 2: shapes.add(new Rectangle()); 
//                 break;               
//       } // End of switch    
//     } // End of if(shapes.size()==0)
//     else {    
//          if (!shapes.get(shapes.size()-1).getBottom() && shapes.get(shapes.size()-1).getMoving()){  
//              for (i=0; i<shapes.size()-1;i++) shapes.get(i).render();
//              shapes.get(shapes.size()-1).update();
//              shapes.get(shapes.size()-1).render();
//          } // End of if (!shapes.get(shapes.size()-1).getBottom() && ...
//          else{ 
//             if(shapes.get(shapes.size()-1).getY()-shapes.get(shapes.size()-1).getH()<= (9*h/10 - 12*unit)) playing =false;
//               else{
//                  type = (int)random(1,3);
//                  switch(type){
//                     case 1: shapes.add(new Square()); 
//                             break;
//                     case 2: shapes.add(new Rectangle()); 
//                             break;               
//                  }  // End of switch
//                }   // End of else 
//               }  // End of else    
//      } // End of else
                   
//   } // End of if(playing)
//   else exit();
//   stroke(3);
//   line(w/4,(9*h/10 - 12*unit), 3*w/4, (9*h/10 - 12*unit));
// } // End of draw()
 
//  void  keyPressed() {
   
//     if (key == CODED) {   
//      if (keyCode == RIGHT && !shapes.get(shapes.size()-1).getBottom() &&
//             shapes.get(shapes.size()-1).getX()+shapes.get(shapes.size()-1).getW() < 2*w/3) {
//               shapes.get(shapes.size()-1).moveR();
              
//      }
//      if (keyCode == LEFT && !shapes.get(shapes.size()-1).getBottom() &&
//             shapes.get(shapes.size()-1).getX()> w/3){
//                shapes.get(shapes.size()-1).moveL();
               
//      }
//       if (keyCode == DOWN && !shapes.get(shapes.size()-1).getBottom() ){
//                shapes.get(shapes.size()-1).setDown();
//      }
//     }
//  } // End of keyPressed()
