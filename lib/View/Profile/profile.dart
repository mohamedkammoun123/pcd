import 'package:flutter/material.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';

import 'Widget.dart';


class Profile extends StatelessWidget {
  int id;
  String nom;
  String prenom;
  String email;
  int numTel;
  Profile(this.id, this.nom, this.prenom,this.email,this.numTel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              FadeAnimation(1.2,CircleAvatar(
                radius: 50,

              )),
              FadeAnimation(1.4,Text(
                nom+" "+prenom,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              )),
              FadeAnimation(1.7,Text(
                "#"+id.toString(),
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey[200],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              )),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd
              FadeAnimation(2.0,InfoCard(text: email, icon: Icons.email, onPressed: () async {})),
              FadeAnimation(2.1,InfoCard(text: numTel.toString(), icon: Icons.phone, onPressed: () async {})),

            ],
          ),
        ));
  }
}