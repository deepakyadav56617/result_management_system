import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Course extends StatefulWidget{
  @override
  _CourseState createState()=>_CourseState();

}

class _CourseState extends State<Course> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.lightBlueAccent,
          title: Text("Semester Result", style: TextStyle(fontSize: 20,),),
          actions: <Widget>[
          ]),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label: "back",
          ),
        ],
      ),

    body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
                 children: <Widget>[
                   SizedBox(
                     width: 10.0,
                   ),
                         ListTile(
                           contentPadding: EdgeInsets.only(top: 10), leading: CircleAvatar(
                           backgroundColor:Colors.lightBlueAccent,
                           child: IconButton(
                             icon: Icon(Icons.auto_stories,color: Colors.white,),),), // no matter how big it is, it won't overflow
                           title: Text("Course Details",textAlign: TextAlign.center,textScaleFactor: 1.4,),
                           ),
                                Divider(thickness: 0.5,),




                            ],),
             ),);
    //throw UnimplementedError();
  }
}
