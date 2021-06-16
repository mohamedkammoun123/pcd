import 'package:http/http.dart' as http;
import 'dart:convert';
class LoiginControlleur{

  validLoigin(String email,String password) async{
    var data={'email':email,'motpasse':password};
    var response=await http.post(Uri.parse("http://192.168.1.14/database/test.php"),body: json.encode(data));
    var message=jsonDecode(response.body);
    return message;
  }

  LoiginControlleur();
}