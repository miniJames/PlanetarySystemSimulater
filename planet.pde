class planet {
  ArrayList<planet> moons;
  float distance, speed, radius, x, y;
  color c;
  //boolean rings;
  planetRings rings;
  String tag;
  planet(float d, float s, int rd, int g, int b, float r, boolean rng, float st ,int n) {
    distance=d;
    speed=s;
    c=color(rd, g, b);
    radius = r;
    moons = new ArrayList<planet>();
    if (distance > 0) {
      x = this.distance * cos(time / this.speed);
      y = this.distance * sin(time / this.speed);
    }
    if (rng) {

      rings=new planetRings(r,st,n);
     
    }
    tag="";
  }
  void drawPlanet() {

    if (distance > 0) {
      x = this.distance * cos(time / this.speed);
      y = this.distance * sin(time / this.speed);
    }
    pushMatrix();

    translate(x, y);

    lights();
    if (tag != "sun") {
      noLights();
    }
    fill(255);
    textSize(10);
    text(this.tag,0+radius,0-radius);
    noStroke();
    fill(c);
    sphere(this.radius);
    for (planet moon : this.moons) {
      moon.drawPlanet();
    }

    popMatrix();
    for (planet moon : this.moons) {
      moon.drawPath(x,y);
    }

    if (rings!=null) {
      rings.drawRings(x,y);
    }
  }
  void drawPath(float x, float y){
      pushMatrix();
      translate(x, y);
      noFill();
      stroke(255);
      circle(0,0,distance *2);
      popMatrix();
  
  }
}
