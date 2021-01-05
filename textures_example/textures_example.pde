PImage diamond, dirt, grass_top, grass_side;
float rotx, roty;

void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  dirt = loadImage("dirt.png");
  grass_top = loadImage("grass_top.png");
  grass_side = loadImage("grass_side.png");

  textureMode(NORMAL);
}

void draw() {
  background(0);

  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(100, height/2, 0, dirt, 100);
  texturedCube(width/2, 100, 0, grass_top, grass_side, dirt, 100);
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(texture);

  //top
  //     x, y, z, texture's x, texture's y
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, -0.5, 0.5, 1, 1);
  vertex(-0.5, -0.5, 0.5, 0, 1);

  //bottom
  vertex(-0.5, 0.5, -0.5, 0, 0);
  vertex(0.5, 0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  //front
  vertex(-0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, 0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  //back
  vertex(0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, -0.5, 1, 0); 
  vertex(-0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, -0.5, 0, 1);

  //left
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, 0.5, 1, 0); 
  vertex(-0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, -0.5, 0, 1);

  //right
  vertex(0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, 0.5, 0, 1);


  endShape();

  //box(1);

  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(top);


  //top
  //     x, y, z, texture's x, texture's y
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, -0.5, 0.5, 1, 1);
  vertex(-0.5, -0.5, 0.5, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottom);

  //bottom
  vertex(-0.5, 0.5, -0.5, 0, 0);
  vertex(0.5, 0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(side);

  //front
  vertex(-0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, 0.5, 1, 0); 
  vertex(0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, 0.5, 0, 1);

  //back
  vertex(0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, -0.5, 1, 0); 
  vertex(-0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, -0.5, 0, 1);

  //left
  vertex(-0.5, -0.5, -0.5, 0, 0);
  vertex(-0.5, -0.5, 0.5, 1, 0); 
  vertex(-0.5, 0.5, 0.5, 1, 1);
  vertex(-0.5, 0.5, -0.5, 0, 1);

  //right
  vertex(0.5, -0.5, 0.5, 0, 0);
  vertex(0.5, -0.5, -0.5, 1, 0); 
  vertex(0.5, 0.5, -0.5, 1, 1);
  vertex(0.5, 0.5, 0.5, 0, 1);
  endShape();

  //box(1);

  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
