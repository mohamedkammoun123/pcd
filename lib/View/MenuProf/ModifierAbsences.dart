import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/AssignerAbsenceControlleur.dart';
import 'package:mobileflutter/Controlleur/AssignerNoteControlleur.dart';
import 'package:mobileflutter/Controlleur/ControlleurModifier.dart';
import 'package:mobileflutter/Model/ListEtudiant.dart';
import 'package:mobileflutter/Model/ModifierAbsence1.dart';


class ModifierAbsencesState extends StatefulWidget {
  final String valeur;
  final String valeur2;
  final String valeur3;
  ModifierAbsencesState(this.valeur,this.valeur2,this.valeur3);

  @override

  State<StatefulWidget> createState() {
    print(valeur2+valeur+valeur3);
    return ModifierAbsences(this.valeur,this.valeur2,this.valeur3);}

}
class ModifierAbsences extends State<ModifierAbsencesState> {

  final TextEditingController Cont=TextEditingController( );
  var list=  List<Map<dynamic,Object>>();
  Map<dynamic, Object> map =  HashMap<dynamic, Object>();
  List l=[];
  ModifierControlleur modifierControlleur = ModifierControlleur();
  bool verif = true;
  int value;
  final String valeur ;
  final String valeur2;
  final String valeur3;
  TextEditingController txt;
  ModifierAbsences(this.valeur,this.valeur2,this.valeur3);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor:  Color.fromRGBO(3, 9, 23, 1),
              title: Text('Modifier Les Absences'),
              automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: Container (child: FutureBuilder<List<Modifier1>>(

              future: modifierControlleur.fetchensdata(valeur2,valeur3),
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
                          label: Text("Absence"),
                        ),
                        DataColumn(
                          label: Text(""),
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

                          Container(
                            child: Text (
                                 data.count.toString(),



                            ),
                          ),
                          onTap:() {
                            print(data.count.toString()+"");
                          },



                        ),
                        DataCell(

                            ClipOval(
                              child: Material(
                                color: Colors.white, // button color
                                child: InkWell(
                                  splashColor: Colors.red, // inkwell color
                                  child: SizedBox(width: 25, height: 25, child: Icon(Icons.remove_circle,size: 20,)),
                                  onTap: ()  {
                                    modifierControlleur.delete(valeur2,data.idEtudiant.toString());
                                    setState(() {
                                      data.count--;
                                    });



                                  },
                                ),
                              ),
                            ),
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
          floatingActionButton:FloatingActionButton(
            onPressed: () => {
              //for(var i in list)
                //assignerAbsenceControlleur.insert(i)




            },
            tooltip: 'Envoyer',
            child: Icon(Icons.add),
          ),
        ));
  }
}

















