class Boolean {
  private boolean bool;
  public Boolean(){ bool = false; }  
  public Boolean(boolean bool){ this.bool = bool;}
  public void setBool(boolean bool){ this.bool = bool;} 
  public void not(){ this.bool = !this.bool;}
  public boolean getBool() { return this.bool;} 
  
}
