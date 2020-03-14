int star_x[];
int star_y[];

void setup()
{
  size(600, 400);
  
  star_x = new int[100];
  for (int i = 0; i < star_x.length; ++i) {
    star_x[i] = (int)random(width);
  }

  star_y = new int[100]; // keep in sync
  for (int i = 0; i < star_y.length; ++i) {
    star_y[i] = (int)random(height);
  }
}

void draw()
{
  fill(0);
  clear();

  stroke(255);
  for (int i = 0; i < star_x.length; ++i) { // because !!
    star_y[i] += 1;
    if (star_y[i] >= height) {
      star_y[i] = 0;
    }
    point(star_x[i], star_y[i]);
  }
  
  fill(0, 255, 0);
  text("framerate=" + frameRate, 20, 20);
}
