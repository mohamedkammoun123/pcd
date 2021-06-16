import 'dart:convert';

List<Absence> absenceFromJson(String str) => List<Absence>.from(json.decode(str).map((x) => Absence.fromJson(x)));

String absenceToJson(List<Absence> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absence {
  Absence({
    this.nom,
    this.count,
  });

  String nom;
  int count;

  factory Absence.fromJson(Map<String, dynamic> json) => Absence(
    nom: json["nom"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "count": count,
  };
}
