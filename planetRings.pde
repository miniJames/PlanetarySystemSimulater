class planetRings {
  float radius;
  int number;
  float start;
  ArrayList<PVector> rings;
  planetRings(float r, float s, int num) {
    rings = new ArrayList<PVector>();
    for (int c=0; c<num; c++) {
      PVector temp = PVector.random2D();
      //temp.x = map(temp.x, 0, 1, 0, TWO_PI);
      //temp.y = map(temp.y, 0, 1, 0, TWO_PI);
      temp.x=cos(temp.x)*c;
      temp.y=sin(temp.y)*c;
      rings.add(temp);
    }  
    number = num;
    radius = r;
    start =s;
  }

  void drawRings(float x, float y) {
    pushMatrix();
    noFill();
    translate(x, y);
    strokeWeight(1);
    stroke(255);
    for (int n=0; n<number; n++) {
      ellipse(0, 0, radius * 2 + start + n, radius *2 + start+ n);
    }
    popMatrix();
  }
  //void drawRingsAsPlanets(float x, float y) {
  //  pushMatrix();
  //  noFill();
  //  translate(x, y);
  //  strokeWeight(1);
  //  stroke(255);

  //  for (PVector r : rings) {
  //    ellipse(x+r.x, y+r.y,1,1);
  //    //translate(r.x+x, r.y+y);
  //    //sphere(1);
      
  //  }
  //  popMatrix();
  //}
}
