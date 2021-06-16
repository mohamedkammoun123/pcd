import 'package:flutter/material.dart';
import 'package:mobileflutter/View/Animation/Animation.dart';

import '../../ListGroups.dart';
import 'ListNote.dart';




void main() => runApp(
    MaterialApp(
        home:NoteOption()
    )
);

class NoteOption extends StatelessWidget {
  String valeur;
  navPush(BuildContext context,String valeur){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ListNoteGroupeState(valeur)));
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
                    "Menu",
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
                              valeur="II1";
                              navPush(context, valeur);

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
                                          "II1",
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
                              valeur="II2";
                              navPush(context, valeur);
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
                                          "II2",
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
                          child: FadeAnimation(2.0,InkWell(
                            onTap: (){
                              valeur="II3";
                              navPush(context, valeur);
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
                                        Image.asset("assets/calendar.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "II3",
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