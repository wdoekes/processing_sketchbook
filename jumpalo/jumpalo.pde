float ACCEL = 9.8 / 6;

class Sprite {
  PImage _img;
  int _imgw, _imgh;
  int _imgx, _imgy;
  int _x, _y;
  float _spdx;
  float _spdy;

  Sprite(int x, int y) {
    _x = x;
    _y = y;
    _setup();
  }

  void _setup() {
    throw new RuntimeException("missing implementation of _setup");
  }

  void setSpeedX(float x) {
    _spdx = x;
  }

  void jump() {
    _spdy = -30;
  }

  boolean isJumping() {
    return (_y < height);
  }

  void update() {
    if (_y < height) {
      _spdy += ACCEL;
    }
    _y += _spdy;
    _x += _spdx;
    if (_x < 0) {
      _x += width;
    } else if (_x >= width) {
      _x -= width;
    }
    if (_y > height) {
      _y = height;
      _spdy = 0;
    }
  }

  void draw() {
    imageMode(CORNER);
    image(_img, _x + _imgx, _y + _imgy, _imgw, _imgh);
    image(_img, _x + _imgx - width, _y + _imgy, _imgw, _imgh);
    //image(_img, _x + _imgx, _y + _imgy, _imgw, _imgh);
    //image(_img, _x + _imgx - width/ 2, _y + _imgy, _imgw, _imgh);
  }
}

class Gruffalo extends Sprite {
  Gruffalo(int x, int y) {
    super(x, y);
  }

  void _setup() {
    _img = loadImage("gruffalo.png");
    _imgx = 0;
    _imgy = -240;
    _imgw = 209;
    _imgh = 246;
  }
}

Gruffalo g[];

void setup() {
  size(1500, 800);
  g = new Gruffalo[5];
  for (int i = 0; i < g.length; ++i) {
    g[i] = new Gruffalo(width * i / g.length, height);
    g[i].setSpeedX(4);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < g.length; ++i) {
    g[i].update();
    g[i].draw();

    if (!g[i].isJumping()) {
      if ((int)random(3) == 0) {
        g[i].jump();
      }
    }
  }
}
