import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/ListEtudiantControlleur.dart';
import 'package:mobileflutter/Controlleur/ListEtudiantControlleur1.dart';
import 'package:mobileflutter/Model/Etudiant.dart';
import 'package:mobileflutter/Model/Etudiant1.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';
import 'package:mobileflutter/View/MenuEtudiant/AbsenceTable.dart';
import 'package:mobileflutter/View/Profile/Widget.dart';
import 'package:mobileflutter/View/Profile/profile.dart';


class etudAbsenceState extends StatefulWidget {

  final String valeur;
  etudAbsenceState(this.valeur);
  State<StatefulWidget> createState(){

    return etudAbsence(this.valeur);
  }
}
class etudAbsence extends State<etudAbsenceState>{
  final String valeur;
  etudAbsence(this.valeur);
  ListEtudiantControlleur1 listEtudiantControlleur=ListEtudiantControlleur1();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(

            title: Text('Liste Des Etudiants'),
            automaticallyImplyLeading: true,
            leading: IconButton(icon:Icon(Icons.arrow_back),

              onPressed:() => Navigator.pop(context, false),
            )
        ),
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body:FutureBuilder<List<Etudiant1>>(

          future: listEtudiantControlleur.fetchetud(valeur),
          builder: (context, snapshot) {

            if (!snapshot.hasData) return Center(
                child: CircularProgressIndicator()
            );

            return ListView(
              children: snapshot.data
                  .map((data) => Column(children: <Widget>[
                FadeAnimation(1.0,InfoCard(text: data.nom+" "+data.prenom, icon: Icons.account_circle, onPressed: () async {
                  Navigator.of(context).push(

                      MaterialPageRoute(
                        builder: (context) => AbsenceTable(data.email.toString()),
                      ));
                })),

                Divider(color: Colors.black),
              ],))
                  .toList(),
            );
          },
        ),
      ),
    );
  }





}