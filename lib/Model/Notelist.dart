import 'dart:convert';

List<Notelist> notelistFromJson(String str) => List<Notelist>.from(json.decode(str).map((x) => Notelist.fromJson(x)));

String notelistToJson(List<Notelist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notelist {
  Notelist({
    this.nom,
    this.prenom,
    this.idEtudiant,
    this.idNote,
    this.valeur,
  });

  String nom;
  String prenom;
  int idEtudiant;
  int idNote;
  int valeur;

  factory Notelist.fromJson(Map<String, dynamic> json) => Notelist(
    nom: json["nom"],
    prenom: json["prenom"],
    idEtudiant: json["idEtudiant"],
    idNote: json["idNote"],
    valeur: json["valeur"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "prenom": prenom,
    "idEtudiant": idEtudiant,
    "idNote": idNote,
    "valeur": valeur,
  };
}
