class player{
  public int x,y,room;
  public player(int a,int b,int c){
    x=a;
    y=b;
    room=c;
  }
  private void draw(){
    fill(120);
    rect(x,y,30,30);
  }
};