
import 'package:flutter/material.dart';
import 'package:mobileflutter/Controlleur/LoiginControlleur.dart';
import 'package:mobileflutter/View/Menu/DashBoardAdmin.dart';

import 'package:mobileflutter/View/MenuEtudiant/DashboardEtudiant.dart';

import 'package:mobileflutter/View/MenuProf/DashboardProf.dart';


import '../Animation/Animation.dart';

class LoginPage extends StatelessWidget {
  final emailControlleur=TextEditingController();
  final motPasseControlleur=TextEditingController();
  LoiginControlleur loiginControlleur=LoiginControlleur();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(1.2, Text("Connexion",
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
            SizedBox(height: 30,),
            FadeAnimation(1.5, Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey[300])),

                    ),
                    child: TextField(
                      controller: emailControlleur,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Email "
                      ),
                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(

                    ),
                    child: TextField(
                      controller: motPasseControlleur,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                          hintText: "Mot De Passe",

                      ),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 40,),
            FadeAnimation(1.8, Center(
              child: InkWell(

                onTap: () async{
                  var message = await loiginControlleur.validLoigin(emailControlleur.text,motPasseControlleur.text);
                  if(message[0]=="Login Matched"){
                    if(message[1]=="admin"){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> MenuAdmin()));
                    }
                    if(message[1]=="prof"){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> DashboardProf(emailControlleur.text)));
                    }
                    if(message[1]=="etudiant"){
                      print("etudiant");
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> DashboardEtudiant(emailControlleur.text)));
                    }

                  }
                },
                child: Container(
                  width: 120,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[800]
                  ),
                  child: Center(child: Text("Se Connecter", style: TextStyle(color: Colors.white.withOpacity(.7)),)),


                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}