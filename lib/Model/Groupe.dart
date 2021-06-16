import 'dart:convert';

List<Groupe> groupeFromJson(String str) => List<Groupe>.from(json.decode(str).map((x) => Groupe.fromJson(x)));

String groupeToJson(List<Groupe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Groupe {
  Groupe({
    this.idGroupe,
    this.niveau,
    this.nomGroupe,
  });

  int idGroupe;
  int niveau;
  String nomGroupe;

  factory Groupe.fromJson(Map<String, dynamic> json) => Groupe(
    idGroupe: json["idGroupe"],
    niveau: json["Niveau"],
    nomGroupe: json["nomGroupe"],
  );

  Map<String, dynamic> toJson() => {
    "idGroupe": idGroupe,
    "Niveau": niveau,
    "nomGroupe": nomGroupe,
  };
}
