import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobileflutter/Model/Etudiant.dart';
class ListEtudiantControlleur{

  Future<List<Etudiant>> fetchetud(String valeur) async{
    var data={'groupe':valeur.toString()};
    print(valeur);
    var response =await http.post(Uri.parse(
        "http://192.168.1.14/database/etudlist.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Etudiant> etudlist = items.map<Etudiant>((json) {
      return Etudiant.fromJson(json);
    }).toList();
    print (etudlist);


    return etudlist;


  }

  ListEtudiantControlleur();
}