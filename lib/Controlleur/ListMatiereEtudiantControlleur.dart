import 'package:mobileflutter/Model/Matiere.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ListMatiereEtudiantControlleur{

  Future<List<Matiere>> fetchensdata(String valeur) async{
    print(valeur);

    var data = {'cin': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/matiereetudiant.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Matiere> etuddata = items.map<Matiere>((json) {
      return Matiere.fromJson(json);
    }).toList();
    print (etuddata);


    return etuddata;


  }

  ListMatiereEtudiantControlleur();
}