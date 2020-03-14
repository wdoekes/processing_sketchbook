class Star {
  int _x;
  int _y;
  int _siz;
  
  Star() {
    _x = (int)random(width);
    _y = (int)random(height);
    _siz = (int)random(3) + 1;
  }
  
  void update() {
    final int velocity = _siz;    
    _y += velocity;
    if (_y >= height) {
      _x = (int)random(width);
      _y = 0;
      _siz = (int)random(3) + 1;
    }
    _draw();
  }
  
  void _draw() {
    switch (_siz) {
    case 3:
      point(_x - 1, _y);
      point(_x, _y - 1);
    case 2:
      point(_x + 1, _y);
    case 1:
      point(_x, _y);
    }
  }
}

class Stars {
  Star _stars[];
  
  Stars() {
    final int count = 1000;
    _stars = new Star[count];
    for (int i = 0; i < _stars.length; ++i) {
      _stars[i] = new Star();
    }
  }
  
  void update() {
    stroke(255);
    for (int i = 0; i < _stars.length; ++i) {
      _stars[i].update();
    }
  }
}


Stars stars;

void setup()
{
  //size(600, 400);
  fullScreen();
  stars = new Stars();
}

void draw()
{
  fill(0);
  clear();
  
  stars.update();
  
  fill(0, 255, 0);
  text("framerate=" + frameRate, 20, 20);
}
