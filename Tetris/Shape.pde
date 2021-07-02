class Shape {
  int x, y;
  int contX, contY;
  int incY;
  int unit;
  int rows, columns;
  int type;
  boolean desc, bottom;;
  color colour;
  ArrayList<ArrayList<Boolean>> matrix = new ArrayList<ArrayList<Boolean>>();

  public Shape(int t, int x, int y, int unit){
    this.x = x;
    this.y = y;
    this.contX = 0;
    this.contY = (int)(x-w/3)/unit;
    this.incY = 2;
    this.unit = unit;
    this.type = (int)random(1,6);
    this.colour = color((int)random(20,255),(int)random(20,255),(int)random(20,255));
    this.setMatrix(t);
    this.rows = matrix.size();
    this.columns = matrix.get(0).size();
    this.desc = true;
    this.bottom = false;
  }
  
  public void render(){
    int i,j;
    fill(this.colour); 
    for(i=0;i<rows;i++){   
       for(j=0;j<columns;j++){
         if((matrix.get(i)).get(j).getBool()){
            rect(x+j*unit, y+i*unit, unit,unit);
         }
       }
    }
  } // End of render()
  
   public void update(){
     int i,j;
     if(desc && y<(9*h/10-(rows*unit))){
       //if(container[contX+rows][contY])
        this.y += incY;
           
     }  // End if(desc)   
      else{ desc = false;
           // bottom = true;
           for(i=0;i<rows;i++){
             for(j=0;j<columns;j++){
                container[i][j] = matrix.get(i).get(j).getBool();
             }  
           }  
      }
   }
  
  public void rotateRight(){
         int i,j;         
         boolean [][] tempArray = new boolean[columns][rows];
         for(i=0;i<rows;i++){   
            for(j=0;j<columns;j++){
              tempArray[j][i] = (matrix.get(i)).get(j).getBool();              
            }  
          }                  
         matrix = new ArrayList<ArrayList<Boolean>>();         
          for(i=0;i<columns;i++){
             for(j=0;j<rows/2;j++){
                boolean temp = tempArray[i][j];
                tempArray[i][j] = tempArray[i][rows-j-1];
                tempArray[i][rows-j-1] = temp;
             } 
          } 
          
          for(i=0;i<columns;i++){   
            ArrayList<Boolean> temp = new ArrayList<Boolean>();
            for(j=0;j<rows;j++){
                 temp.add(new Boolean(tempArray[i][j]));
            }
             matrix.add(temp);
          }  
        // this.x += (matrix.size() - this.rows) * this.unit/2;
         this.y += (matrix.get(0).size() - this.columns) * this.unit/2; 
         this.rows = matrix.size();
         this.columns = matrix.get(0).size();
         if(x+columns*unit>2*w/3) x=2*w/3 - columns*unit;
         for(j=0;j<columns;j++){
           i=0;
           do{ 
           if(matrix.get(rows- ++i).get(j).getBool()){
              
            } 
           }while(!matrix.get(rows-i).get(j).getBool());
         } 
  }  // End of rotateRight()
  
  public void moveR(){
    if(shape.x+shape.columns*unit < 2*w/3)
      shape.x += unit;
  }
  
  public void moveL(){
    if(shape.x > w/3)
        shape.x -= unit;
  }
  
  public void setMatrix(int t){
     switch (t){
        case 1: matrix1(); 
                break;
        case 2: matrix2(); 
                break;
        case 3: matrix3(); 
                break;
        case 4: matrix4(); 
                break;
        case 5: matrix5(); 
                break;
     } 
  }  // End of setMatrix()
  
  public void matrix1(){
    int i,j;
    for(i=0;i<2;i++){   
      ArrayList<Boolean> temp = new ArrayList<Boolean>();
      for(j=0;j<3;j++){
        if(i==0) temp.add(new Boolean(true));
          else if(j==1) temp.add(new Boolean(true));
                  else temp.add(new Boolean(false));
       }
       matrix.add(temp);
     }
  } // end of matrix1() 

   public void matrix2(){
      int i,j;
      for(i=0;i<2;i++){   
       ArrayList<Boolean> temp = new ArrayList<Boolean>();
       for(j=0;j<3;j++){
         if(i==0) temp.add(new Boolean(true));
            else if(j==2) temp.add(new Boolean(true));
                   else temp.add(new Boolean(false));
       }
       matrix.add(temp);
     }
   }  // end of matrix2() 
   
   public void matrix3(){
     int i,j;
     for(i=0;i<3;i++){   
        ArrayList<Boolean> temp = new ArrayList<Boolean>();
        for(j=0;j<2;j++){
           if(j==0) temp.add(new Boolean(true));
                else if(i==2) temp.add(new Boolean(true));
                   else temp.add(new Boolean(false));
        }
        matrix.add(temp);
     }
   }   // end of matrix3() 

   public void matrix4(){
      int i,j;
      for(i=0;i<3;i++){   
         ArrayList<Boolean> temp = new ArrayList<Boolean>();
         for(j=0;j<2;j++){
            if(j==0 && i<2) temp.add(new Boolean(true));
              else if(j==1 && i>0) temp.add(new Boolean(true));
                    else temp.add(new Boolean(false));
          }
          matrix.add(temp);
      } 
   }  // end of matrix4()
  
     
    public void matrix5(){
      int i,j;
      for(i=0;i<4;i++){   
         ArrayList<Boolean> temp = new ArrayList<Boolean>();
         for(j=0;j<2;j++){
            if(j==0) temp.add(new Boolean(true));
               else if(j==1 && i==0) temp.add(new Boolean(true));
                        else temp.add(new Boolean(false));
          }
          matrix.add(temp);
      } 
   }  // end of matrix5()
 
}


//class Shape {
//   int type; 
//   int x;
//   int y;
//   int tempY;
//   int incY;
//   int dist;
//   int index;
//   int hShape;
//   int wShape;
//   ArrayList<boolean[]> array ;
//   color colour;
//   color bckg;
//   boolean atBottom;
//   boolean down;
//   boolean noDown;
//   boolean moving;
   
//   Shape(int t){
//     this.type = t;   
//     this.y = h/10;
//     this.incY = 2;
//     this.dist = 0;
//     this.array = new ArrayList<boolean[]>();
//     this.colour = color((int)random(20,255),(int)random(20,255),(int)random(20,255)); 
//     this.bckg = color(217, 255, 245);
//     this.atBottom = false;
//     this.down = false;
//     this.noDown = true;
//     this.moving = true;
//     //tempY = 0;
//   }
    
//   void render(){}
//   void update(){    
//     for(int i=0; moving && i<(int)(wShape/unit); i++){
//         if(bck == get((x+(i*unit)+1),y))moving = true;
//             else moving = false;
//     }  
//     //if(moving)print(moving);
//     if(moving) {
//          if(!atBottom && y< 9*h/10){
//              if (down){
//                if(noDown){
//                  noDown = false; 
//                  incY *= 5;
//                  do{ dist++; }while(bck==get(x+1,y+dist));
//                }
                 
//                if(bck == get(x+1,y+incY)){
//                     y += incY;
//                     dist -= incY;
//                }       
//                 else {
//                      y += dist;
//                      dist = 0;
//                      moving = false;
//                     if(y >=  9*h/10 - 2) {
//                       atBottom = true;
//                       y = 9*h/10;
//                     } // End of if(y >= 9*h/10 - 2)
//                 } // End else
//             } // End of if(down)
//                 else{
//                    y += incY;
//                    tempY = y;  
//                 }
//          } // End of if(!atBottom && y< 9*h/10)
//            else{
//               atBottom = true;
//               moving = false;
//               for(int i=0;i<(int)(wShape/unit);i++){
//                  int levelX = i+ index;
//                  level[levelX] += hShape;
//               }
//            }
//     } // End of if(moving)
//      else{   
//           int levelX = index;
//            for(int i=0;i<(int)(wShape/unit);i++){
//                  levelX = i+ index;
//                  level[levelX] += hShape;
//               }
//      }
//   }
   
//   boolean getBottom(){ return atBottom;}
//   boolean getMoving(){return moving;}
//   int getX(){ return x;}
//   int getW(){ return wShape;}
//   int getY(){ return y;}
//   int getH(){return hShape;}
//   void setH(){ hShape -= unit;}
//   void setX(int x){ this.x += x;}
//   void setY(int y){ this.y = y;}
//   void moveR(){
//     if(bck == get(x+wShape+2, y) && bck == get(x+wShape+2, y - hShape + 2)){
//       this.x += unit;
//       this.index++;
//     }

//   }
//   void moveL(){
//     if(bck == get(x-2, y) && bck == get(x-2, y - hShape + 2)) {
//       this.x -= unit;
//       this.index--;
//     }
//   }
//   void setDown(){down = true;}
//   void setIndex(int inc){index += inc;}
//}
