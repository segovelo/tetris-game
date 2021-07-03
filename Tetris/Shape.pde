class Shape {
  int x, y;
  int contX, contY;
  int incY;
  int unit;
  int rows, columns;
  int type;
  int[] borderX;
  int[] borderY;
  int[] borderDX;
  //int[] borderDY;
  boolean desc, bottom, checkCell,stop;
  color colour;
  ArrayList<ArrayList<Boolean>> matrix = new ArrayList<ArrayList<Boolean>>();

  public Shape(int t, int x, int y, int unit){
    this.x = x;
    this.y = y;
    this.unit = unit;
    this.incY = unit/20;    
    this.type = (int)random(1,6);
    this.colour = color((int)random(20,255),(int)random(20,255),(int)random(20,255));
    this.setMatrix(t);
    this.rows = matrix.size();
    this.columns = matrix.get(0).size();   
    this.contY = (int)((x-w/3)/unit);
    this.borders();
    this.bordersDown();
    this.contX = rows-1;
    this.desc = true;
    this.bottom = false;
    this.checkCell = true;
    this.stop = false;
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
     int i,j, upper=2*incY; 
     if((y+rows*unit-offsetY)%unit < upper & (y+rows*unit-offsetY)%unit > 2 & checkCell){
        borders();    
        checkCell = false;
        checkDown();
     }    
     if( !checkCell & (y+rows*unit-offsetY )%unit > upper)checkCell = true;
     if(desc && y<(offsetY+16*unit-(rows*unit))){
       //if(container[contX+rows][contY])
       if(y>(offsetY+16*unit-(rows*unit)-incY)){
           y = (offsetY+16*unit-(rows*unit));
       }
           else this.y += incY;
           
     }  // End if(desc)   
      else{ desc = false;
           // bottom = true;
           y = (offsetY+16*unit-(rows*unit));
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
         this.borders();
         this.bordersDown();
         if(x+columns*unit>2*w/3) x=2*w/3 - columns*unit;
  }  // End of rotateRight()
  
  public void moveR(){
    if(shape.x+shape.columns*unit < 2*w/3){
      shape.x += unit;
      contY++;
      for(int j=0;j<columns;j++) borderY[j]++;
    }
  }
  
  public void moveL(){
    if(shape.x > w/3){
        shape.x -= unit;
        contY--;
        for(int j=0;j<columns;j++) borderY[j]--;
    }
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
 
   public void checkDown(){
      for(int j=0;!stop&&j<columns;j++){
         if(container[borderX[j]][borderY[j]]) stop = true;
      }
   } // End of checkDown()
 
   public void borders(){
     int i,j;
     borderX = new int[columns];
     borderY = new int[columns];
     setContX();
     for(j=0;j<columns;j++){
        i=0;
        do{ 
           if(matrix.get(rows- ++i).get(j).getBool()){
               borderX[j] = contX-i+1;
               borderY[j] = contY+j;
            } 
          }while(rows-i>=0 && !matrix.get(rows-i).get(j).getBool());
      } 
   } // End of borders()
   
   public void bordersDown(){
     borderDX = new int[columns];
     setContX();
     for(j=0;j<columns;j++){
        borderDX[j] = contX - rows + borderX[j] + 1;
     }     
   }
   
   public void setContX(){
     contX = ((y+rows*unit-offsetY)/unit);
   } // End of setContX()
}
