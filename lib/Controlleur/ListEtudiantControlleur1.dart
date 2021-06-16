import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobileflutter/Model/Etudiant.dart';
import 'package:mobileflutter/Model/Etudiant1.dart';
class ListEtudiantControlleur1{

  Future<List<Etudiant1>> fetchetud(String valeur) async{
    var data={'groupe':valeur.toString()};
    print(valeur);
    var response =await http.post(Uri.parse(
        "http://192.168.1.14/database/etudlist1.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Etudiant1> etudlist = items.map<Etudiant1>((json) {
      return Etudiant1.fromJson(json);
    }).toList();
    print (etudlist);


    return etudlist;


  }

  ListEtudiantControlleur1();
}