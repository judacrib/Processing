int WIDTH = 600;
int HEIGHT = 200;

float cloudx = 0.0;
float cloudy = 0.0;
float grey = 0.0;

size(500, 500);
background(204, 255, 255);


/* Clouds Emerge! */
for (int i = 0; i < WIDTH; i+=50) {
  for (int j = 0; j < HEIGHT; j+=20) {
    cloudx = random(60, 80);
    cloudy = random(20, 35);
    grey = random(150, 240);
    
    stroke(grey);
    fill(grey);
    ellipse(i + random(-15, 15), j + random(-15, 15), cloudx, cloudy);   
  
  }
}