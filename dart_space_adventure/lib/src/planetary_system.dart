import 'planet.dart';

class PlanetarySystem {
  String name;
  List<Planet> planets;

  PlanetarySystem({this.name = "No Name", this.planets = const[]});

  int get numOfPlanets => planets.length;
}