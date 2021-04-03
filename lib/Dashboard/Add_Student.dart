import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADDStudentHomeScreen extends StatefulWidget{
@override
_ADDStudentHomeScreen createState()=> _ADDStudentHomeScreen();
}

class _ADDStudentHomeScreen extends State<ADDStudentHomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Student" ,style: TextStyle(fontSize: 20,),),

      ),

      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios),title:Text("back")),
        ],
      ),



    );
  }
}