class planetarySystem {
  //ArrayList<planet> planets = new ArrayList<planet>();
  planet main;
  planetarySystem(planet m) {
    main = m;
    
  }
  planetarySystem() {

    
  }
  void drawSystem() {
    main.drawPlanet();
    for(planet p: main.moons){
      p.drawPath( main.x,  main.y);
    
    }
    //for (planet p : main.moons) {
    //  p.drawPlanet() ;
    //}
  }
}
