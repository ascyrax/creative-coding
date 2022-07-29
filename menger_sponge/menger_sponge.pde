void setup() {
  size(1920, 1080, P3D);
  //frameRate(1);
  boxes = new ArrayList<Box>();
  boxes.add(new Box(0, 0, 0, bsize));
  //fullScreen();
}

float bsize= 200;// box size

void draw() {
  background(52);
  //stroke(255);
  noFill();
  lights();
  translate(width/2, height/2, 0);
  rotateBox();
  renderAllBoxes();
}

void mousePressed() {
  generateBoxes();
  //renderAllBoxes();
}

ArrayList<Box> boxes;

float rx=0;
float ry=0;
float rz=0;

void rotateBox() {
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  rx += 0.01;
  ry += 0.01;
  rz += 0.01;
}

void generateBoxes() {
  ArrayList<Box> newBoxes = new ArrayList<Box>();
  for (Box el : boxes) {
    ArrayList<Box>generatedBoxes = el.generateBoxes();
    for (Box b : generatedBoxes)
      newBoxes.add(b);
  }
  println("newBoxes.size(): ", newBoxes.size());
  println("boxes.size(): ", boxes.size());
  boxes.clear();
  for (Box el : newBoxes)
    boxes.add(el);

  println("boxes.size(): ", boxes.size());
}

void renderAllBoxes() {
  for (Box el : boxes) {
    el.render();
  }
}
