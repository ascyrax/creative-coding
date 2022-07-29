class Box {
  float x, y, z, bsize;

  Box(float x, float y, float z, float bsize) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.bsize = bsize;
  }

  ArrayList<Box> generateBoxes() {
    ArrayList<Box> newBoxes = new ArrayList<Box>();
    float elsize = bsize/3;

    for (int i=-1; i<=1; i++) {
      for (int j=-1; j<=1; j++) {
        for (int k=-1; k<=1; k++) {
          if(i==0 && j==0 && k==0)continue;
          if(i==0 && j==0)continue;
          if(j==0 && k==0)continue;
          if(k==0 && i==0)continue;
           newBoxes.add(new Box(x + i*elsize, y + j*elsize, z + k*elsize, elsize));
        }
      }
    }
    return newBoxes;
  }

  void render() {
    pushMatrix();
    translate(this.x, this.y, this.z);
    noStroke();
    fill(155,225,180);
    box(bsize);
    popMatrix();
  }
}
