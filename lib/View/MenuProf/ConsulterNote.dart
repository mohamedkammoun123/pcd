import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/AssignerAbsenceControlleur.dart';
import 'package:mobileflutter/Controlleur/AssignerNoteControlleur.dart';
import 'package:mobileflutter/Controlleur/ConsulterNoteControlleur.dart';
import 'package:mobileflutter/Controlleur/ConsulterNoteControlleur.dart';
import 'package:mobileflutter/Controlleur/ConsulterNoteControlleur.dart';
import 'package:mobileflutter/Model/ListEtudiant.dart';
import 'package:mobileflutter/Model/Notelist.dart';


class ConsulterNoteState extends StatefulWidget {
  final String valeur;
  final String valeur2;
  final String valeur3;
  ConsulterNoteState(this.valeur,this.valeur2,this.valeur3);

  @override

  State<StatefulWidget> createState() {return ConsulterNote(this.valeur,this.valeur2,this.valeur3);}

}
class ConsulterNote extends State<ConsulterNoteState> {

  final TextEditingController Cont=TextEditingController( );
  var list=  List<Map<dynamic,Object>>();
  Map<dynamic, Object> map =  HashMap<dynamic, Object>();
  List l=[];
  ConsulterNoteControlleur ConsulternoteControlleur = ConsulterNoteControlleur();
  final String valeur ;
  final String valeur2;
  final String valeur3;
  ConsulterNote(this.valeur,this.valeur2,this.valeur3);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor:  Color.fromRGBO(3, 9, 23, 1),
              title: Text('Consulter Les Notes Du CC'),
              automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: Container (child: FutureBuilder<List<Notelist>>(

              future: ConsulternoteControlleur.fetchensdata(valeur2),
              builder: (context, snapshot) {

                if (!snapshot.hasData) return Center(
                    child: CircularProgressIndicator()
                );

                return SingleChildScrollView(scrollDirection: Axis.vertical,

                  child: SingleChildScrollView(

                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                      columns: [
                        DataColumn(
                          label: Text('Nom'),
                        ),
                        DataColumn(
                          label: Text('Prenom'),
                        ),
                        DataColumn(
                          label: Text('Note'),
                        )
                        // Lets add one more column to show a delete bu//
                      ],
                      // the list should show the filtered list now
                      rows: snapshot.data .map((data) => DataRow(cells: [
                        DataCell(
                          Text(data.nom),
                          // Add tap in the row and populate the
                          // textfields with the corresponding values to update

                        ),
                        DataCell(
                          Text(data.prenom),                //={'idnote':a,'note':b,'nommatiere':'alg','cin':c};
                          onTap: () {},
                        ),
                        DataCell(
                          Text(data.valeur.toString()),

                         // TextFormField(

                            //onFieldSubmitted: (value){print (value);map=({"valeur":int.parse(value),"idMatiere":valeur3,'idEtudiant':data.idEtudiant});list.add(map);},//verifier cin a deja une note!




                          onTap:() {},



                        ),


                      ])
                      )
                          .toList(),
                    ),

                  ),

                );

              }

          ),


          ),
          // floatingActionButton:FloatingActionButton(
          // onPressed: () => {
          //  for(var i in list)
          //   assignerAbsenceControlleur.insert(i)




          //  },
          //  tooltip: 'Envoyer',
          //  child: Icon(Icons.add),
          //  ),
        ));
  }
}

















