class Square extends Shape{
  Square(){
    super(1);
    hShape = 2*unit;
    wShape = 2*unit;
    index = (int)random(0,6);
    this.x = w/3 + (unit * index);
    for(int i=0;i<2;i++){
       boolean[] a = new boolean[2];
       a[0] = true;
       a[1] = true;
      this.array.add(a);
    }
  }
  
   void render(){
     fill(colour);
     rect(x,y, wShape-1, -hShape);
   }
   
}
