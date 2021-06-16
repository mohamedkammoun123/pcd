import 'dart:convert';

List<Etudiant> etudiantFromJson(String str) => List<Etudiant>.from(json.decode(str).map((x) => Etudiant.fromJson(x)));

String etudiantToJson(List<Etudiant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Etudiant {
  Etudiant({
    this.idEtudiant,
    this.idGroupe,
    this.idUser,
    this.nom,
    this.prenom,
    this.numTel,
    this.idCompte,
  });

  int idEtudiant;
  int idGroupe;
  int idUser;
  String nom;
  String prenom;
  int numTel;
  int idCompte;

  factory Etudiant.fromJson(Map<String, dynamic> json) => Etudiant(
    idEtudiant: json["idEtudiant"],
    idGroupe: json["idGroupe"],
    idUser: json["idUser"],
    nom: json["nom"],
    prenom: json["prenom"],
    numTel: json["numTel"],
    idCompte: json["idCompte"],
  );

  Map<String, dynamic> toJson() => {
    "idEtudiant": idEtudiant,
    "idGroupe": idGroupe,
    "idUser": idUser,
    "nom": nom,
    "prenom": prenom,
    "numTel": numTel,
    "idCompte": idCompte,
  };
}
