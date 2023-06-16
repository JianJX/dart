import 'dart:io';
import 'dart:math';

import 'package:dart_space_adventure/dart_space_adventure.dart';

class SpaceAdventure {
  final PlanetarySystem planetarySystem;

  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    namePrompt();
    planetPrompt();
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numOfPlanets} planets to explore.');
  }

  void namePrompt() {
    print('What is your name?');
    final name = stdin.readLineSync();
    print('Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
    print('Let\'s go on an adventure!');
  }
  
  void planetPrompt() {
    while (true) {
      var choice;
      print('Shall I randomly choose a planet for you to visit? (Y or N)');
      choice = stdin.readLineSync();
      if (choice == 'Y') {
        final random = new Random();
        var i = random.nextInt(planetarySystem.numOfPlanets);
        var p = planetarySystem.planets[i];
        printPlanet(p.name, p.description);
        return;
      }
      else if (choice == 'N') {
        print('Name the planet you would like to visit.');
        var name = stdin.readLineSync();
        for (var p in planetarySystem.planets) {
          if (name == p.name) {
            printPlanet(p.name, p.description);
            return;
          }
        }
        printPlanet('Null', ' Null');
        return;
      }
      print('Sorry, I didn\'t get that');
    }
  }

  void printPlanet(String name, String description) {
    print('Traveling to $name...');
    print('Arriving at $name. $description');
  }
}