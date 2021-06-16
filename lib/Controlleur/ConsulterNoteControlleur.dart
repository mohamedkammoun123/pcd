import 'package:mobileflutter/Model/Notelist.dart';
import 'package:mobileflutter/Model/Repartition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ConsulterNoteControlleur{
  Future<List<Notelist>> fetchensdata(String valeur) async{
    print(valeur);

    var data = {'idMatiere': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/ConsulterNote.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Notelist> ensdata = items.map<Notelist>((json) {
      return Notelist.fromJson(json);
    }).toList();
    print (ensdata);


    return ensdata;


  }

  ConsulterNoteControlleur();
}