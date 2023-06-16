import 'package:dart_space_adventure/dart_space_adventure.dart';
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  File(arguments[0]).readAsString().then((String contents) {
    var data = json.decode(contents);
    List<Planet> planets_list = [];
    for (var p in data['planets']) {
      var planet = Planet(name: p['name'], description: p['description']);
      planets_list.add(planet);
    }
    final ps = PlanetarySystem(name: data['name'], planets: planets_list);
    final spaceAdventure = SpaceAdventure(planetarySystem: ps);
    spaceAdventure.start();
  });
}

