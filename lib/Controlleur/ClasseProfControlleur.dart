import 'package:mobileflutter/Model/Repartition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ClasseProfControlleur{
  Future<List<Repartition>> fetchensdata(String valeur) async{
    print(valeur);

    var data = {'cin': valeur};
    var response = await http.post(Uri.parse(
        "http://192.168.1.14/database/classprof.php"), body: json.encode(data)
    );
    final items = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Repartition> ensdata = items.map<Repartition>((json) {
      return Repartition.fromJson(json);
    }).toList();
    print (ensdata);


    return ensdata;


  }

  ClasseProfControlleur();
}