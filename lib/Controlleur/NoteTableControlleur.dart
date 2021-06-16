import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobileflutter/Model/Note.dart';
class NoteTableControlleur{
  Future<List<Note>> fetchensdata(String valeur) async{
    print(valeur);

    var data = {'cin': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/noteetudiant.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Note> etuddata = items.map<Note>((json) {
      return Note.fromJson(json);
    }).toList();
    print (etuddata);


    return etuddata;


  }
}