import 'dart:convert';

List<ListEtudiant> listEtudiantFromJson(String str) => List<ListEtudiant>.from(json.decode(str).map((x) => ListEtudiant.fromJson(x)));

String listEtudiantToJson(List<ListEtudiant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListEtudiant {
  ListEtudiant({
    this.nom,
    this.prenom,
    this.idEtudiant

  });

  String nom;
  String prenom;
  dynamic idEtudiant;

  factory ListEtudiant.fromJson(Map<String, dynamic> json) => ListEtudiant(
    nom: json["nom"],
    prenom: json["prenom"],
    idEtudiant: json["idEtudiant"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "prenom": prenom,
    "idEtudiant" : idEtudiant,
  };
}
