class star_t { // een "struct" in C
  int x;
  int y;
  // int siz;
};

star_t stars[];

void setup()
{
  size(600, 400);
  
  stars = new star_t[100];
  for (int i = 0; i < stars.length; ++i) {
    stars[i] = new star_t();
    stars[i].x = (int)random(width);
    stars[i].y = (int)random(height);
    // stars[i].siz = (int)random(3) + 1;
  }
}

void draw()
{
  fill(0);
  clear();

  stroke(255);
  for (int i = 0; i < stars.length; ++i) {
    stars[i].y += 1; // stars[i].siz;
    if (stars[i].y >= height) {
      stars[i].y = 0;
    }
    // extra code voor mooiere point() bij >1 siz
    point(stars[i].x, stars[i].y);
  }
  
  fill(0, 255, 0);
  text("framerate=" + frameRate, 20, 20);
}
