
import 'package:mobileflutter/Model/ListEtudiant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AssignerNoteControlleur{
  Future<List<ListEtudiant>> fetchetudp(String valeur) async{
    print(valeur);

    var data = {'groupe': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/profetud.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<ListEtudiant> etudp = items.map<ListEtudiant>((json) {
      return ListEtudiant.fromJson(json);
    }).toList();
    print (etudp);


    return etudp;


  }
  insert(var data) async {
    await http.post(Uri.parse(
        "http://192.168.1.14/database/assignernote.php"), body: json.encode(data)
    );

     await http.post(Uri.parse(
        "http://192.168.1.14/database/assignernote.php"), body: json.encode(data)
    );



  }
}