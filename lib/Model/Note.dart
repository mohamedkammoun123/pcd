import 'dart:convert';

List<Note> noteFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String noteToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    this.nom,
    this.valeur,
  });

  String nom;
  dynamic valeur;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    nom: json["nom"],
    valeur: json["valeur"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "valeur": valeur,
  };
}
