boolean isUp,isDown,isLeft,isRight,isMap;

void keyPressed() {
  setMove(keyCode, true);
}

void keyReleased() {
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;
  case DOWN:
    return isDown = b;
  case LEFT:
    return isLeft = b;
  case RIGHT:
    return isRight = b;
  case 77:
    return isMap = b;
  default:
    return b;
  }
}

void keys() {
    if (isUp) {
      if(m.collision(p.x,p.y-1)){
         p.y-=2;
      }
    }
    if (isDown) {
     if(m.collision(p.x,p.y+1)){
         p.y+=2;
      }
    }
    if (isLeft) {
      if(m.collision(p.x-1,p.y)){
         p.x-=2;
      }
    }
    if (isRight) {
       if(m.collision(p.x+1,p.y)){
         p.x+=2;
      }
    }
}