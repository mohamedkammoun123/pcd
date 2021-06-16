// To parse this JSON data, do
//
//     final modifier1 = modifier1FromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Modifier1> modifier1FromJson(String str) => List<Modifier1>.from(json.decode(str).map((x) => Modifier1.fromJson(x)));

String modifier1ToJson(List<Modifier1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modifier1 {
  Modifier1({
    this.nom,
    this.prenom,
    this.idEtudiant,
    this.count,
  });

  String nom;
  String prenom;
  int idEtudiant;
  int count;
  bool verif=true;
  int value;
  TextEditingController txt=TextEditingController();
  factory Modifier1.fromJson(Map<String, dynamic> json) => Modifier1(
    nom: json["nom"],
    prenom: json["prenom"],
    idEtudiant: json["idEtudiant"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "prenom": prenom,
    "idEtudiant": idEtudiant,
    "count": count,
  };
  desincriment(){
    count--;
  }


}
