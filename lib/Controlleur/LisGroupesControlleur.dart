import 'package:mobileflutter/Model/Groupe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ListGroupesControlleur{
  Future<List<Groupe>> fetchGroupe(String valeur) async{
    var data={'nomgroupe':valeur.toString()};
    print(valeur);
    var response =await http.post(Uri.parse(
        "http://192.168.1.14/database/classlist.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Groupe> groupelist = items.map<Groupe>((json) {
      return Groupe.fromJson(json);
    }).toList();
    print (groupelist);


    return groupelist;


  }

  ListGroupesControlleur();
}