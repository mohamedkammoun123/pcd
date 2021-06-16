import 'package:mobileflutter/Model/Absence.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AbsenceMatiereControlleur{
  Future<List<Absence>> fetchensdata(String valeur) async{
    print(valeur);

    var data = {'cin': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/absenceetudiant.php"), body: json.encode(data)
    );
    print(response.body);
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Absence> etuddata = items.map<Absence>((json) {
      return Absence.fromJson(json);
    }).toList();
    print (etuddata);


    return etuddata;


  }

  AbsenceMatiereControlleur();
}