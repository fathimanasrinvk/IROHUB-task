// To parse this JSON data, do
//
//     final superheroModel = superheroModelFromJson(jsonString);

import 'dart:convert';

SuperheroModel superheroModelFromJson(String str) => SuperheroModel.fromJson(json.decode(str));

String superheroModelToJson(SuperheroModel data) => json.encode(data.toJson());

class SuperheroModel {
  List<Superhero>? superheros;

  SuperheroModel({
    this.superheros,
  });

  factory SuperheroModel.fromJson(Map<String, dynamic> json) => SuperheroModel(
    superheros: json["superheros"] == null ? [] : List<Superhero>.from(json["superheros"]!.map((x) => Superhero.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "superheros": superheros == null ? [] : List<dynamic>.from(superheros!.map((x) => x.toJson())),
  };
}

class Superhero {
  String? name;
  String? power;
  String? url;

  Superhero({
    this.name,
    this.power,
    this.url,
  });

  factory Superhero.fromJson(Map<String, dynamic> json) => Superhero(
    name: json["name"],
    power: json["power"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "power": power,
    "url": url,
  };
}
