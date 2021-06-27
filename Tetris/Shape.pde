class Shape {
   int type; 
   int x;
   int y;
   int tempY;
   int incY;
   int dist;
   int index;
   int hShape;
   int wShape;
   ArrayList<boolean[]> array ;
   color colour;
   color bckg;
   boolean atBottom;
   boolean down;
   boolean noDown;
   boolean moving;
   
   Shape(int t){
     this.type = t;   
     this.y = h/10;
     this.incY = 2;
     this.dist = 0;
     this.array = new ArrayList<boolean[]>();
     this.colour = color((int)random(20,255),(int)random(20,255),(int)random(20,255)); 
     this.bckg = color(217, 255, 245);
     this.atBottom = false;
     this.down = false;
     this.noDown = true;
     this.moving = true;
     //tempY = 0;
   }
    
   void render(){}
   void update(){    
     for(int i=0; moving && i<(int)(wShape/unit); i++){
         if(bck == get((x+(i*unit)+1),y))moving = true;
             else moving = false;
     }  
     //if(moving)print(moving);
     if(moving) {
          if(!atBottom && y< 9*h/10){
              if (down){
                if(noDown){
                  noDown = false; 
                  incY *= 5;
                  do{ dist++; }while(bck==get(x+1,y+dist));
                }
                 
                if(bck == get(x+1,y+incY)){
                     y += incY;
                     dist -= incY;
                }       
                 else {
                      y += dist;
                      dist = 0;
                      moving = false;
                     if(y >=  9*h/10 - 2) {
                       atBottom = true;
                       y = 9*h/10;
                     } // End of if(y >= 9*h/10 - 2)
                 } // End else
             } // End of if(down)
                 else{
                    y += incY;
                    tempY = y;  
                 }
          } // End of if(!atBottom && y< 9*h/10)
            else{
               atBottom = true;
               moving = false;
               for(int i=0;i<(int)(wShape/unit);i++){
                  int levelX = i+ index;
                  level[levelX] += hShape;
               }
            }
     } // End of if(moving)
      else{   
           int levelX = index;
            for(int i=0;i<(int)(wShape/unit);i++){
                  levelX = i+ index;
                  level[levelX] += hShape;
               }
      }
   }
   
   boolean getBottom(){ return atBottom;}
   boolean getMoving(){return moving;}
   int getX(){ return x;}
   int getW(){ return wShape;}
   int getY(){ return y;}
   int getH(){return hShape;}
   void setH(){ hShape -= unit;}
   void setX(int x){ this.x += x;}
   void setY(int y){ this.y = y;}
   void moveR(){
     if(bck == get(x+wShape+2, y) && bck == get(x+wShape+2, y - hShape + 2)){
       this.x += unit;
       this.index++;
     }

   }
   void moveL(){
     if(bck == get(x-2, y) && bck == get(x-2, y - hShape + 2)) {
       this.x -= unit;
       this.index--;
     }
   }
   void setDown(){down = true;}
   void setIndex(int inc){index += inc;}
}
