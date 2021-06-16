import 'package:mobileflutter/Model/ModifierAbsence1.dart';
import 'package:mobileflutter/Model/Repartition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ModifierControlleur{
  Future<List<Modifier1>> fetchensdata(String valeur,String valeur1) async{
    print(valeur);

    var data = {'groupe': 2,'idMatiere' :1};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/ModifierAbsence.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Modifier1> ensdata = items.map<Modifier1>((json) {
      return Modifier1.fromJson(json);
    }).toList();
    print (ensdata);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(valeur);
    print(valeur1);
    return ensdata;


  }
  delete(String idMatiere,String idEtudiant ) async {

    var data ={'idEtudiant':idEtudiant,'idMatiere':idMatiere};
    return (await http.post(Uri.parse(
        "http://192.168.1.14/database/SupprimerAbsence.php"), body: json.encode(data)
    ));



  }

  ModifierControlleur();
}