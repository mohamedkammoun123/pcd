import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:mobileflutter/Controlleur/LisGroupesControlleur.dart';
import 'dart:convert';

import 'package:mobileflutter/Model/Groupe.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';
import 'package:mobileflutter/View/Menu/Listematiere.dart';
import 'package:mobileflutter/View/Menu/option/Absence/LIstEtudiantAbsence.dart';
import 'package:mobileflutter/View/Profile/Widget.dart';



class ListAbsenecGroupeState extends StatefulWidget {
  final String valeur;
  ListAbsenecGroupeState(this.valeur);
  @override
  State<StatefulWidget> createState() {return ListAbsenecGroupe(this.valeur);}
}

class ListAbsenecGroupe extends State<ListAbsenecGroupeState> {
  final String valeur ;

  ListAbsenecGroupe(this.valeur);
  ListGroupesControlleur listGroupesControlleur=ListGroupesControlleur();
  @override





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(3, 9, 23, 1),
            appBar: AppBar(

                title: Text('Liste Des Groupes'),
                automaticallyImplyLeading: true,
                leading: IconButton(icon:Icon(Icons.arrow_back),

                  onPressed:() => Navigator.pop(context, false),
                )
            ),
            body: FutureBuilder<List<Groupe>>(
              future: listGroupesControlleur.fetchGroupe(valeur),
              builder: (context, snapshot) {

                if (!snapshot.hasData) return Center(
                    child: CircularProgressIndicator()
                );

                return ListView(
                  children: snapshot.data.map((data) => Column(children: <Widget>[

                    FadeAnimation(1.0,InfoCard(text: data.nomGroupe, icon: Icons.adjust_rounded, onPressed: ()  {
                      print(data.nomGroupe);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => etudAbsenceState(data.idGroupe.toString())),
                        //builder: (context) => ListematiereState(data.idGroupe.toString())),
                      );},)),

                    Divider(color: Colors.black),
                  ],))
                      .toList(),
                );
              },
            )
        ));
  }
}