import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:mobileflutter/Controlleur/AbsenceMatiereControlleur.dart';
import 'package:mobileflutter/Model/Absence.dart';


class AbsenceTable extends StatefulWidget {
  final String valeur;

  AbsenceTable(this.valeur);

  @override

  State<StatefulWidget> createState() {return AbsenceTableState(this.valeur);}

}
class AbsenceTableState extends State<AbsenceTable> {
  AbsenceMatiereControlleur absenceMatiereControlleur=AbsenceMatiereControlleur();
  final TextEditingController Cont=TextEditingController( );
  var list=  List<Map<String,Object>>();
  Map<String, Object> map =  HashMap<String, Object>();
  List l=[];

  final String valeur ;

  AbsenceTableState(this.valeur);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          appBar: AppBar(
              title: Text('Absence'),
              backgroundColor:  Color.fromRGBO(3, 9, 23, 1),
              automaticallyImplyLeading: true,
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: InkWell (child: FutureBuilder<List<Absence>>(

              future: absenceMatiereControlleur.fetchensdata(valeur),
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
                          label: Text('Nom Matière'),
                        ),
                        DataColumn(
                          label: Text("Nombre d'absence "),
                        )
                        // Lets add one more column to show a delete bu//
                      ],
                      // the list should show the filtered list now
                      rows: snapshot.data .map((data) => DataRow(

                          cells: [
                            DataCell(
                              Text(
                                  data.nom,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black
                                  ),
                              ),
                              // Add tap in the row and populate the
                              // textfields with the corresponding values to update

                            ),
                            DataCell(
                              Text(
                                data.count.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black
                                ),
                              ),                //={'idnote':a,'note':b,'nommatiere':'alg','cin':c};
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

        ));
  }
}
















