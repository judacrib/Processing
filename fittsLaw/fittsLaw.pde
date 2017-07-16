int HEIGHT = 400;
int WIDTH = 600;

Timer timer = new Timer();
int y = 0;
int w = 15;

int x1 = 0;
int x2 = 0;
int x = 0;
int dist = WIDTH/6;

double[] times = new double[6];


Rectangle r1 = new Rectangle(0, 0, 0, 0);
Rectangle r2 = new Rectangle(0, 0, 0, 0);
Rectangle r  = new Rectangle(0, 0, 0, 0);
Rectangle cl = new Rectangle(0, 0, WIDTH, HEIGHT);

int b1 = 255;
int b2 = 0;

int counter = 0;
int varr = 1;

void setup(){
  timer.start();
  size(600, 400);
  cl.setColor(119, 136, 153);
  cl.render();
  println("CLICK BLUE LINE");
  println("avg reaction time (ms):");
}

void draw(){
  // draw rectangles
  x1 = WIDTH/2 - w - dist/2;
  x2 = x1 + dist + w;
  
  if (x == 0) {
    x = x1;
  }
      
  r1 = new Rectangle(x1, y, w, HEIGHT);
  r2 = new Rectangle(x2, y, w, HEIGHT);
  
  if (b1 == 255) {
    r = r1;
  } else {
    r = r2;
  }

  r1.setColor(0, 0, b1);
  r2.setColor(0, 0, b2);
  
  
  r1.render();
  r2.render();
  
}

void mouseClicked(){
  // This method is called whenever a mouse click occurs.
  // Use the global variables mouseX and mouseY to get current mouse coordinates.
  double time = 0;
 
  if (r.isInside(mouseX, mouseY)) {
    counter++;
    timer.pause();
    time = timer.getTime();
    timer.reset();
    
    times[counter-1] = time;
     
    if (x == x2 || x == 0) {
      b1 = 255;
      b2 = 0;
      x = x1;
    } else {
      b1 = 0;
      b2 = 255;
      x = x2;
    }
    
    if (counter%6 == 0) {
      if (varr%3 == 0) {
        dist *= 2;
        w = 0;
      }
      
      w += 15;
      counter = 0;
      varr++;
      cl.render();
      x = 0;
      println(timer.getAvg(times));
    }
    timer.start();
  }
}

/*
Simple class to record elapsed time.
Usage:
Timer timer = new Timer();
timer.start();   // start counting time from 0
timer.pause();   // pause
timer.start();   // continue counting from when it was paused
timer.pause();   // pause again
timer.getTime(); // get accumulated time in miliseconds
timer.reset();   // make it ready for a new run
*/
class Timer{
  
  int accTime   = 0,
      lastStart = 0;
      
  boolean paused = true;
  
  public void start(){
    this.lastStart = millis();
    this.paused    = false;
  }
  
  public void pause(){
    this.accTime += millis() - lastStart;
    paused = true;
  }
  
  public int getTime(){
    return paused ? accTime : accTime + (millis() - lastStart);
  }
  
  public double getAvg(double[] numbers) {
    double sum = 0.0;
    for(int i=0; i < numbers.length ; i++) {
      sum = sum + numbers[i];
    }
       
     return sum / numbers.length;
  }
  
  public void reset(){
    this.accTime   = 0;
    this.lastStart = 0;
    this.paused    = true;
  }
  
  public boolean isPaused(){return this.paused;};
}


class Rectangle{
  int x, y, w, h;
  int r = 0, g = 0, b = 0; // default color is black
  
  // constructor
  public Rectangle(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  };
  
  public void setColor(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  };
  
  /* Draws the rectangle */
  public void render(){
    fill(this.r, this.g, this.b);
    rect(x, y, w, h);
  }

  /* Check if a given point lies within this rectangle */
  public boolean isInside(int x, int y){
    x = x - this.x;
    y = y - this.y;
    return x >= 0 && x <= this.w && y >= 0 && y <= this.h;
  }
  
}