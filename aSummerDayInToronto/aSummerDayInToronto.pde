int WIDTH = 500;
int HEIGHT = 200;
float RAY_ANGLE = PI/2 + 0.5;
int SUN_DIAMETER = 150;

float cloudx = 0.0;
float cloudy = 0.0;
float grey = 0.0;
float ray_length = 0.0;
float rand_colorx = 0.0;
float rand_colory = 0.0;

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

/* Where you at Sun Rays?! */
for (float f = -0.5; f < RAY_ANGLE; f += 0.01) {
  
  ray_length = 1.2 * SUN_DIAMETER + random(-10, 10);  
  rand_colorx = random(-10, 10);
  rand_colory = random(150, 255);
  
  stroke(240 - rand_colorx, rand_colory, 102);
  strokeWeight(2);

  line(WIDTH - ray_length * sin(f), ray_length * cos(f), WIDTH, 0);  
}

fill(255, 255, 102);

/* Feel the Sun Burn? */
float y = 0.0;
float sun_offset = random(5, 15);
float size_offset =random(3, 5);
for (float f = 0.0; f < RAY_ANGLE; f += 0.01) {
  y = SUN_DIAMETER * cos(f);
  
  for (float x = WIDTH - SUN_DIAMETER * sin(f); x < WIDTH; x += 3) {
    /* Get rand flamboyant colors */
    rand_colorx = random(-15, 15);
    rand_colory = random(150, 255);
    fill(240 - rand_colorx, rand_colory, 102);
    stroke(240 - rand_colorx, rand_colory, 102);
   
    ellipse(x + random(-sun_offset, sun_offset),
            y + random(-sun_offset, sun_offset), 
            2 + random(-size_offset, size_offset),
            2 + random(-size_offset, size_offset));
  }
}