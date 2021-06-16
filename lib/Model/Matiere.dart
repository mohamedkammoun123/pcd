
import 'dart:convert';

List<Matiere> matiereFromJson(String str) => List<Matiere>.from(json.decode(str).map((x) => Matiere.fromJson(x)));

String matiereToJson(List<Matiere> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matiere {
  Matiere({
    this.idMatiere,
    this.idGroupe,
    this.idProf,
    this.nom,
  });

  int idMatiere;
  int idGroupe;
  int idProf;
  String nom;

  factory Matiere.fromJson(Map<String, dynamic> json) => Matiere(
    idMatiere: json["idMatiere"],
    idGroupe: json["idGroupe"],
    idProf: json["idProf"],
    nom: json["nom"],
  );

  Map<String, dynamic> toJson() => {
    "idMatiere": idMatiere,
    "idGroupe": idGroupe,
    "idProf": idProf,
    "nom": nom,
  };
}
