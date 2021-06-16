import 'dart:convert';

List<Repartition> repartitionFromJson(String str) => List<Repartition>.from(json.decode(str).map((x) => Repartition.fromJson(x)));

String repartitionToJson(List<Repartition> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Repartition {
  Repartition({
    this.nomGroupe,
    this.nom,
    this.idGroupe,
    this.idMatiere,
  });

  String nomGroupe;
  String nom;
  dynamic idGroupe;
  dynamic idMatiere;
  factory Repartition.fromJson(Map<String, dynamic> json) => Repartition(
    nomGroupe: json["nomGroupe"],
    nom: json["nom"],
    idGroupe: json["idGroupe"],
    idMatiere :json["idMatiere"],
  );

  Map<String, dynamic> toJson() => {
    "nomGroupe": nomGroupe,
    "nom": nom,
    "idGroupe":idGroupe,
    "idMatiere":idMatiere,
  };
}
