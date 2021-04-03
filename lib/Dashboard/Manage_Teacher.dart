import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:result_management_system/Dashboard/Add_Teacher.dart';

class TeacherHomeScreen extends StatefulWidget{
  @override
  _TeacherHomeScreen createState()=> _TeacherHomeScreen();
}

class _TeacherHomeScreen extends State<TeacherHomeScreen>{
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
      body:Stack(

        children: <Widget>[

          Container(
            // margin: EdgeInsets.only(top:170),
            color: Color(0xFFF0F0F0),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              //childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/2.5),
              primary: false,

              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ADDTeacherHomeScreen()),
                      );
                    });
                  },


                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                    ),
                    elevation: 6,
                    margin: EdgeInsets.only(left:10,right:10,bottom: 20,top:20),

                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        Image.asset("images/notepad.png",height: 20 ,width:20),
                        Text('Add Students', style: TextStyle(fontSize: 25,),),

                      ],

                    ),

                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  margin: EdgeInsets.only(left:10,right:10,bottom:20,top:20),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/notepad.png",height: 20 ,width:20),
                      Text('Delete Students',style: TextStyle(fontSize:25),),
                    ],
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  margin: EdgeInsets.only(left:10,right:10,bottom:20,top:20),
                  child: Column(
                    children: <Widget>[
                      //Image.asset("images/notepad.png",height: 20 ,width:20),
                      Image(image:AssetImage('images/notepad.png')),
                      Text('View Students',style: TextStyle(fontSize:25),),
                    ],
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  margin: EdgeInsets.only(left:10,right:10,bottom:20,top:20),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/notepad.png",height: 20 ,width:20),
                      Text('Contact',style: TextStyle(fontSize:25),),
                    ],
                  ),
                ),
              ],

            ),
          ),
        ],
      ),


    );
  }
}