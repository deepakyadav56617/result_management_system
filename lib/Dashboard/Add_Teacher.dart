import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADDTeacherHomeScreen extends StatefulWidget{
  @override
  _ADDTeacherHomeScreen createState()=> _ADDTeacherHomeScreen();
}

class _ADDTeacherHomeScreen extends State<ADDTeacherHomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Teacher" ,style: TextStyle(fontSize: 20,),),

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