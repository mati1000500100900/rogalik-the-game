class map {
  ArrayList<room> rooms = new ArrayList<room>();
  public map() {
    rooms.add(new room(0, 0));
  }
  public boolean collision(int px, int py) {
    if (px>=380 && px+30<=420 && (py<40 || py+30>560)) {
      if (py<10 && isUp) {
        rooms.get(p.room).doors[0].open();
      } else if (py>560 && isDown) {
        rooms.get(p.room).doors[1].open();
      }
      return true;
    } else if (py>=280 && py+30<=320 && (px<40 || px+30>760)) {
      if (px<10 && isLeft) {
        rooms.get(p.room).doors[2].open();
      } else if (px>760 && isRight) {
        rooms.get(p.room).doors[3].open();
      }
      return true;
    } else if (px<40 || px+30>760 || py<40 || py+30>560) {
      return false;
    } else return true;
  }
};
class door {
  public int pos, x, y;
  private int xx, xy;
  public door(int a, int b, int c) {
    pos=a;
    switch (pos) {
    case 0:
      x=b;
      y=c-1;
      xx=0;
      xy=280;
      break;
    case 1:
      x=b;
      y=c+1;
      xx=760;
      xy=280;
      break;
    case 2:
      x=b-1;
      y=c;
      xx=380;
      xy=0;
      break;
    case 3:
      x=b+1;
      y=c;
      xx=380;
      xy=560;
      break;
    default:
      break;
    }
  }
  public void draw() {
    fill(40);
    rect(xx, xy, 40, 40);
  }
  public void open() {
    println("otfarte"+m.rooms.size());
    int exists=-1;
    for (int i=0; i<m.rooms.size(); i++) {
      room r=m.rooms.get(i);
      if (r.x==x && r.y==y) {
        exists=i;
      }
    }
    if (exists==-1) {
      m.rooms.add(new room(x, y));
      p.room=m.rooms.size()-1;
    } else p.room=exists;

    switch (pos) {
    case 0:
      p.y=560;
      break;
    case 1:
      p.y=10;
      break;
    case 2:
      p.x=760;
      break;
    case 3:
      p.x=10;
      break;
    }
  }
};
class room {
  public int x, y;
  public door[] doors = new door[4];
  public box[] boxes = new box[4];
  
  public room(int a, int b) {
    x=a;
    y=b;
    for (int i=0; i<4; i++) {
      doors[i]=new door(i, x, y);
    }
    for (int i=0; i<4; i++) {
      boxes[i]=new box((int)random(600)+50,(int)random(400)+50);
    }
  }
  private void draw() {
    text(x+", "+y, 2, 10);
    fill(40);
    rect(40, 40, 720, 520);
    for (int i=0; i<4; i++) {
      doors[i].draw();
    }
    for (int i=0; i<boxes.length; i++) {
      boxes[i].draw();
    }
  }
};
class box {
  public int x, y;
  private box(int a, int b) {
    x=a;
    y=b;
  }
  public void draw(){
    fill(0);
    rect(x,y,40,40);
  }
};