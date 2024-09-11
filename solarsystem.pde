import peasy.*;
PeasyCam cam;
float time = 0;
boolean record=false;
planet e;
planetarySystem ps;
void setup() {
  //frameRate(10);
  fullScreen(P3D);
  //size(1000, 1000, P3D);
  cam = new PeasyCam(this, width/2, height/2, height/2, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(100000);
  background(0);
  solarSystem();
  //randomSystem();
  //centralEarthSolarSystem();
  
}
//void keyPressed(){
//  if(key=='r'){
//    //record=!record;  
//  } 
//}
void draw() {
  background(0);
  time -=0.01;

  pushMatrix();
  translate(width / 2, height / 2, height / 2);
  //translate(e.x, e.y,height/2);
  //cam.lookAt(e.x,e.y,height/2);
  //camera(mouseX, mouseY, 220.0, // eyeX, eyeY, eyeZ
  //     mouseX, mouseY, 0.0, // centerX, centerY, centerZ
  //     0.0, 1.0, 0.0);
  pointLight(255, 255, 0, 0, 0, 0);
  ps.drawSystem();
  popMatrix();
  if(record){
    saveFrame("solarSystem-######.tif");
  }
}

void randomSystem() {
  ps = new planetarySystem();

  int max=10;// floor(random(10));
  planet sun;
  sun = new planet(0, random(1, 1.5), 255, 255, 0, 25, false, 0, 0);
  ps.main= sun; 
  println(max);
  for (int c=1; c<max; c++) {
    randomAddPlanet(sun);
  }
}

void randomAddPlanet(planet main) {
  boolean r;
  int rn=floor(random(-1, 10));
  int s, n;
  s=0;
  n=0;
  if (rn==-1) {
    r=true;
    s=floor(random(15));
    n=floor(random(15));
  } else {
    r=false;
  }
  int dist = floor(random(30, width));
  int re, g, b;

  re=floor(random(64, 192));
  g=floor(random(64, 192));
  b=floor(random(64, 192));
  planet p = new planet(dist, random(.5, 4), re, g, b, floor(random(30)), r, s, n);
  main.moons.add(p);

  if (random(0, 1) < .5) {
    int num = floor(random(0, 7));
    for (int c=0; c<num; c++) {
      println("adding moon");
      randomAddMoon(p);
    }
  }
}

void randomAddMoon(planet p) {
  boolean r;
  //int rn=floor(random(-1, 10));
  int s, n;
  s=0;
  n=0;
  r=false;
  int dist = floor(random(p.radius +1, p.radius*5));
  int re, g, b;
  re=floor(random(64, 192));
  g=floor(random(64, 192));
  b=floor(random(64, 192));
  planet pmoon = new planet(dist, random(.5, 10), re, g, b, floor(random(p.radius/3)), r, s, n);
  p.moons.add(pmoon);
}

void solarSystem() {
  ps = new planetarySystem();

  planet sun = new planet(0, 0, 255, 255, 0, 15, false, 0, 0);
  ps.main=sun;
  sun.tag = "sun";
  sun.moons.add(new planet(45, 0.24109589041, 180, 180, 180, .5, false, 0, 0));  //Mercury:
  sun.moons.add(new planet(84, 0.61643835616, 255, 0, 255, 1, false, 0, 0));  //Venus:

  planet earth = new planet(117, 1, 100, 100, 255, 1, false, 0, 0);
  earth.moons.add(new planet(earth.radius +3, 0.076712, 255, 255, 255, .5, false, 0, 0));
  e=earth;
  earth.tag = "earth";
  sun.moons.add(earth);

  planet mars = new planet(179, 1.19, 255, 30, 30, 2, false, 0, 0);
  mars.moons.add(new planet(mars.radius+2, 0.05, 245, 245, 245, .5, false, 0, 0));
  sun.moons.add(mars);

  planet jupiter = new planet(610, 11.78, 200, 200, 15, 10, false, 0, 0);
  jupiter.moons.add(new planet(jupiter.radius + 2, 1.769137786, 200, 250, 100, .5, false, 0, 0)); //io
  sun.moons.add(jupiter);

  planet saturn = new planet(1125, 30.136, 180, 200, 150, 9, true, 15, 30);
  sun.moons.add(saturn);

  planet uranus = new planet(2253, 84.93150384, 240, 240, 255, 6, false, 0, 0);
  sun.moons.add(uranus);

  planet neptune = new planet(3528, 165, 30, 40, 250, 3.8, false, 0, 0);
  sun.moons.add(neptune);
}

void centralEarthSolarSystem() {
  ps = new planetarySystem();
  planet earth = new planet(0, 0, 100, 100, 255, 1, false, 0, 0);
  earth.moons.add(new planet(earth.radius +3, 0.076712, 255, 255, 255, .5, false, 0, 0));
  e=earth;
  earth.tag = "earth";
  ps.main=(earth);

  planet sun = new planet(117, 1, 255, 255, 0, 15, false,0, 0);
  ps.main.moons.add(sun);
  sun.tag = "sun";

  planet mercury = new planet (45, 0.24109589041, 180, 180, 180, .5, false, 0, 0);  //Mercury:
  mercury.tag = "Mercury";
  sun.moons.add(mercury);  //Mercury:

  planet venus = new planet(84, 0.61643835616, 255, 0, 255, 1, false, 0, 0);
  venus.tag  = "Venus";
  sun.moons.add(venus);  //Venus:

  planet mars = new planet(179, 1.19, 255, 30, 30, 2, false, 0, 0);
  mars.moons.add(new planet(mars.radius+2, 0.05, 245, 245, 245, .5, false, 0, 0));
  mars.tag = "Mars";
  sun.moons.add(mars);

  planet jupiter = new planet(610, 11.78,200,200,15, 10, false, 0, 0);
  jupiter.moons.add(new planet(jupiter.radius + 2, 1.769137786, 200, 200, 200, .5, false, 0, 0)); //io
  jupiter.tag="Jupiter";
  sun.moons.add(jupiter);

  planet saturn = new planet(1125, 30.136, 180, 200, 150, 9, true, 15, 30);
  saturn.tag = "Saturn";

  sun.moons.add(saturn);

  planet uranus = new planet(2253, 84.93150384, 100, 100, 255, 6, false, 0, 0);
  uranus.tag = "Uranus";
  sun.moons.add(uranus);

  planet neptune = new planet(3528, 165, 30, 40, 250, 3.8, false, 0, 0);
  neptune.tag= "Neptune";
  sun.moons.add(neptune);
}
