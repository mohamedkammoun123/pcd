import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/AssignerAbsenceControlleur.dart';
import 'package:mobileflutter/Model/ListEtudiant.dart';


class assignerabsenceState extends StatefulWidget {
  final String valeur;
  final String valeur2;
  final String valeur3;
  assignerabsenceState(this.valeur,this.valeur2,this.valeur3);

  @override

  State<StatefulWidget> createState() {return assignerabsence(this.valeur,this.valeur2,this.valeur3);}

}
class assignerabsence extends State<assignerabsenceState> {

  final TextEditingController Cont=TextEditingController( );
  var list=  List<Map<dynamic,Object>>();
  Map<dynamic, Object> map =  HashMap<dynamic, Object>();
  List l=[];
  AssignerAbsenceControlleur assignerAbsenceControlleur = AssignerAbsenceControlleur();
  final String valeur ;
  final String valeur2;
  final String valeur3;
  assignerabsence(this.valeur,this.valeur2,this.valeur3);
  @override



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              backgroundColor:  Color.fromRGBO(3, 9, 23, 1),
              title: Text('Assigner Les Absences'),
              automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: Container (child: FutureBuilder<List<ListEtudiant>>(

              future: assignerAbsenceControlleur.fetchetudp(valeur),
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
                        )
                        // Lets add one more column to show a delete bu//
                      ],
                      // the list should show the filtered list now
                      rows: snapshot.data .map((data) => DataRow(
                          selected: l.contains(data.idEtudiant),
                          onSelectChanged: (isSelected) => setState(() {
                            final isAdding = isSelected != null && isSelected;

                            isAdding
                                ? l.add(data.idEtudiant)
                                : l.remove(data.idEtudiant);
                          }),
                          cells: [
                            DataCell(
                              Text(data.nom),
                              // Add tap in the row and populate the
                              // textfields with the corresponding values to update
                              //onTap: (){Navigator.of(context).push(

                                //MaterialPageRoute(
                                    //builder: (context) => EtudiantListState(data.cin.toString())),
                              //);},
                            ),
                            DataCell(
                              Text(data.prenom),                //={'idnote':a,'note':b,'nommatiere':'alg','cin':c};
                              onTap: () {},
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
            onPressed: ()  => {
              {print(l)},
              for (var i in l)
                list.add({'idEtudiant':i,'idMatiere':valeur2}),
              print(list),
              for (var j in list)
                assignerAbsenceControlleur.insert(j),
              l=[],






            },
            tooltip: 'Envoyer',
            child: Icon(Icons.add),
          ),
        ));
  }
}
















