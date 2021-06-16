import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/ListEtudiantControlleur.dart';
import 'package:mobileflutter/Model/Etudiant.dart';


class testState extends StatefulWidget {

  final String valeur;
  testState (this.valeur);
  State<StatefulWidget> createState(){

    return etud(this.valeur);
  }
}
class etud extends State<testState >{
  final String valeur;
  etud(this.valeur);
  ListEtudiantControlleur listEtudiantControlleur=ListEtudiantControlleur();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Etudiant>>(
      future: listEtudiantControlleur.fetchetud(valeur),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
        );

        return ListView(
          children: snapshot.data
              .map((data) => Row(children: <Widget>[
            GestureDetector(
              //onTap: (){Navigator.of(context).push(

              //MaterialPageRoute(
              //builder: (context) => EtudiantListState(data.cin.toString())),
              //);},
              child: Card(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Text(data.nom.toString(),
                              style: TextStyle(fontSize: 21),
                              textAlign: TextAlign.left)),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Text(data.prenom.toString(),
                              style: TextStyle(fontSize: 21),
                              textAlign: TextAlign.left)),


                    ]),
              ),),

            Divider(color: Colors.black),
          ],))
              .toList(),
        );
      },
    );
  }





}