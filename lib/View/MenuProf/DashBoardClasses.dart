import 'package:flutter/material.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';
import 'package:mobileflutter/View/Menu/ListGroups.dart';
import 'package:mobileflutter/View/MenuEtudiant/NoteTable.dart';
import 'package:mobileflutter/View/MenuEtudiant/AbsenceTable.dart';
import 'package:mobileflutter/View/MenuProf/AssignerAbsences.dart';
import 'package:mobileflutter/View/MenuProf/ClassesProf.dart';
import 'package:mobileflutter/View/MenuProf/ModifierAbsences.dart';

import 'AssignerNote.dart';
import 'ConsulterNote.dart';

class DashboardClasses extends StatelessWidget {
  String valeur;
  String valeur2;
  String valeur3;
  DashboardClasses(this.valeur,this.valeur2,this.valeur3);
  navPush(BuildContext context,String valeur){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> classprofState(valeur)));
  }
  navPush1(BuildContext context,String valeur,String valeur2,String valeur3){
  Navigator.push(context,MaterialPageRoute(builder: (context)=> assignerabsenceState(valeur,valeur2,valeur3)));
  }
  navPush2(BuildContext context,String valeur,String valeur2,String valeur3){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> assignerNoteState(valeur,valeur2,valeur3)));
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30,
                        onPressed:() => Navigator.pop(context, false),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: FadeAnimation(0.5,Text(
                    "Option",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.start,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing:20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: FadeAnimation(2,InkWell(
                            onTap: (){
                              navPush1(context,valeur,valeur2,valeur3);

                            },
                            child: Card(


                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/todo.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Absences",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          )),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: FadeAnimation(2,InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> ModifierAbsencesState(valeur,valeur2,valeur3)));
                            },
                            child: Card(

                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/note.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Modifier Les Absences",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          )),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: FadeAnimation(2,InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> ConsulterNoteState(valeur,valeur2,valeur3)));                            },
                            child: Card(

                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[

                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Consulter les     notes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          )),
                        ),
                        SizedBox(
                          width:160.0,
                          height: 160.0,
                          child: FadeAnimation(2,InkWell(
                            onTap: (){
                              navPush2(context,valeur,valeur2,valeur3);

                            },
                            child: Card(


                              color: Color.fromARGB(255,21, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[

                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Assigner les notes",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          )),
                        ),



                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}