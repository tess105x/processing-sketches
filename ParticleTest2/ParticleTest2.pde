int size = 1950;
particle[] Particles = new particle[size];
void setup() {
  
  size(500,500);
  for (int i = 0; size > i; i++) {
    Particles[i] = new particle();
    Particles[i].reset();
    
  }
}
void draw() {
  background(120);
  for (int i = 0; size > i; i++) {
    Particles[i].update();
    if (Particles[i].timeSurvied() == true) {
      Particles[i].reset();
    }
  }
  //particles die after timeSurvied is greater than x
}


class particle {
  float y;
  float gravity;
  float x;
  int generations;
  int maxAge;
  float downY;
  float orginY;
  float orginX;
  float moveX;
  void update() {
    noStroke();
    gravity = gravity + .1;
    fill(generations*y/50,0,abs(250-x)/4,150);
    y = y + gravity;
    x = x + moveX;
    generations = generations + 1;
    ellipse(orginX+x,orginY+y,10-y/50,10-y/50);
    
  }
  boolean timeSurvied() {
    if (orginY+y > 500) {
      return true;
    }
    return false;
    /*
    if (generations > maxAge) {
      return true;
    }
    return false;
    */
  }
  void reset() {
    moveX = random(-1,1);
    orginY = mouseY;
    orginX = mouseX;
    maxAge = (int) random(5,45);
    gravity = random(-3,0);
   y = 0;
  x = random(-1,1);
  generations = (int) random(-1,1);
   
  
  }
  
}