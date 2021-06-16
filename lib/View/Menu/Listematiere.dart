import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/ClasseProfControlleur.dart';
import 'package:mobileflutter/Model/Repartition.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';
import 'package:mobileflutter/View/MenuProf/DashBoardClasses.dart';
import 'package:mobileflutter/View/Profile/Widget.dart';


class ListematiereState extends StatefulWidget {
  final String valeur;
  ListematiereState(this.valeur);
  @override
  State<StatefulWidget> createState() {return Listematiere(this.valeur);}
}
class Listematiere extends State<ListematiereState> {
  final String valeur ;
  Listematiere(this.valeur);
  ClasseProfControlleur classeProfControlleur=ClasseProfControlleur();


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
            backgroundColor: Color.fromRGBO(3, 9, 23, 1),
            appBar: AppBar(
                title: Text('Liste Des Matières'),
                automaticallyImplyLeading: true,
                leading: IconButton(icon:Icon(Icons.arrow_back),
                  onPressed:() => Navigator.pop(context, false),
                )
            ),
            body: FutureBuilder<List<Repartition>>(
              future: classeProfControlleur.fetchensdata(valeur),
              builder: (context, snapshot) {

                if (!snapshot.hasData) return Center(
                    child: CircularProgressIndicator()
                );

                return ListView(
                  children: snapshot.data.map((data) => Column(children: <Widget>[
                    FadeAnimation(1.0,InfoCard(text:"Matière: "+data.nom, icon: Icons.account_circle, onPressed: () async {Navigator.of(context).push(

                      MaterialPageRoute(
                          builder: (context) => DashboardClasses(data.nomGroupe,data.nom,data.idGroupe.toString())),
                    );})),

                    Divider(color: Colors.black),
                  ],))
                      .toList(),
                );
              },
            )
        ));
  }
}


























