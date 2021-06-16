import 'dart:convert';

List<Etudiant1> etudiant1FromJson(String str) => List<Etudiant1>.from(json.decode(str).map((x) => Etudiant1.fromJson(x)));

String etudiant1ToJson(List<Etudiant1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Etudiant1 {
  Etudiant1({
    this.idEtudiant,
    this.idGroupe,
    this.idUser,
    this.nom,
    this.prenom,
    this.numTel,
    this.idCompte,
    this.email,
    this.password,
    this.ident,
  });

  int idEtudiant;
  int idGroupe;
  int idUser;
  String nom;
  String prenom;
  int numTel;
  int idCompte;
  String email;
  dynamic password;
  String ident;

  factory Etudiant1.fromJson(Map<String, dynamic> json) => Etudiant1(
    idEtudiant: json["idEtudiant"],
    idGroupe: json["idGroupe"],
    idUser: json["idUser"],
    nom: json["nom"],
    prenom: json["prenom"],
    numTel: json["numTel"],
    idCompte: json["idCompte"],
    email: json["Email"],
    password: json["Password"],
    ident: json["ident"],
  );

  Map<String, dynamic> toJson() => {
    "idEtudiant": idEtudiant,
    "idGroupe": idGroupe,
    "idUser": idUser,
    "nom": nom,
    "prenom": prenom,
    "numTel": numTel,
    "idCompte": idCompte,
    "Email": email,
    "Password": password,
    "ident": ident,
  };
}
