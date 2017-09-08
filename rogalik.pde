player p = new player(100,100,0);
map m = new map();

void setup(){
  size(800,600,FX2D);
  frameRate(60);
  
}

void draw(){
  background(160);
  keys();
  m.rooms.get(p.room).draw();
  p.draw();
  if(isMap){
    background(160);
    fill(80);
    pushMatrix();
    room r=m.rooms.get(p.room);
    translate((width/2)-(r.x*40),(height/2)-(r.y*30));
    for(int i=0;i<m.rooms.size();i++){
      r=m.rooms.get(i);
      rect(r.x*40,r.y*30,38,28);
    }
    popMatrix();  
  }
}