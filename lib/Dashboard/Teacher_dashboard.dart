import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:result_management_system/Dashboard/Course_detail.dart';
import 'package:result_management_system/Dashboard/Current_Sem_Result.dart';
import 'package:result_management_system/Dashboard/Previous_Sem_Result.dart';
import 'package:result_management_system/Dashboard/ReadExcel.dart';
import 'package:result_management_system/Dashboard/ResetpassWord.dart';
import 'package:result_management_system/Profile/AdminProfile.dart';
import 'package:result_management_system/set_up/login.dart';
import 'package:result_management_system/Dashboard/result_profile.dart';
import 'package:result_management_system/Profile/TeacherProfile.dart';
import '../Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class THomeScreen extends StatefulWidget{
  @override
  _THomeScreenState createState()=> _THomeScreenState();
}


class _THomeScreenState extends State<THomeScreen> {
  final AuthenticationService _auth = AuthenticationService();
  String myEmail;
  String name;
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.pinkAccent,
        elevation: 8,
        shadowColor: Colors.black12,
        title: Text("Dashboard" ,style: TextStyle(fontSize: 26,),),

      ),

      drawer: Drawer(
        child: FutureBuilder(
            future: _fetch(),
            builder: (context , snapshot){
              if(snapshot.connectionState != ConnectionState.done)
                return Text("");
              return ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(name,style: TextStyle(fontSize: 20),),
                    accountEmail: Text(myEmail,style: TextStyle(fontSize: 16),),
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage('https://cdn.pixabay.com/photo/2015/12/01/15/43/black-1072366__340.jpg'),
                        )
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        name[0],
                        style: TextStyle(fontSize: 40.0,color: Colors.pinkAccent),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle,color: Colors.pinkAccent,), title: Text("View profile",style: TextStyle(fontSize: 16),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tprofile()),
                      );
                    },
                    hoverColor: Colors.purpleAccent,
                    enabled: true,
                    trailing: Icon(Icons.arrow_forward_outlined,color: Colors.black,),

                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: Icon(Icons.vpn_key,color: Colors.pinkAccent,), title: Text("Change Password",style: TextStyle(fontSize: 16),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetPassword()),
                      );
                    },
                    trailing: Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: Icon(Icons.logout,color: Colors.pinkAccent,), title: Text("Logout",style: TextStyle(fontSize: 16),),
                    onTap: () {
                      _auth.signOut().then((result){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );

                      });
                    },
                    trailing: Icon(Icons.arrow_forward_outlined,color: Colors.black,),

                  ),
                  Divider(thickness: 0.5,),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined,color: Colors.pinkAccent,), title: Text("About Us",style: TextStyle(fontSize: 16),),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    trailing: Icon(Icons.arrow_forward_outlined,color: Colors.black,),
                  ),
                ],);

            }),

      ),


      body:Stack(


        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top:170),
            color: Colors.white,
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
                        MaterialPageRoute(builder: (context) => Previous_Sem_Result()),
                      );
                    });
                  },


                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    color: Colors.white,
                    shadowColor: Colors.pinkAccent,
                    margin: EdgeInsets.only(left:15,right:15,bottom: 25,top:25),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        Image.asset("images/graduated.png",height: 70 ,width:40,color: Colors.pinkAccent,),
                        Text('Students', style: TextStyle(fontSize: 25,),),

                      ],

                    ),

                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Current_Sem_Result()),
                      );
                    });
                  },


                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                      //side: BorderSide(color: Colors.black),
                    ),
                    elevation: 8,
                    shadowColor: Colors.pinkAccent,
                    color: Colors.white,
                    margin: EdgeInsets.only(left:15,right:15,bottom: 25,top:25),

                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height:15,
                        ),
                        Image.asset("images/class.png",height: 70 ,width:40,color: Colors.pinkAccent,),
                        Text('Teachers', style: TextStyle(fontSize: 25,),),

                      ],

                    ),

                  ),
                ),


                GestureDetector(
                  onTap: () {setState(() {Navigator.push(context, MaterialPageRoute(builder: (context) => ReadExcel()),);});},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    shadowColor: Colors.pinkAccent,
                    margin: EdgeInsets.only(left:15,right:15,bottom:25,top:25),
                    child: Column(
                      children: <Widget>[
                        Image.asset("images/book.png",height: 70 ,width:40,color: Colors.pinkAccent),
                        Text('Courses',style: TextStyle(fontSize:25),),
                      ],
                    ),
                  ),
                ),

                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(15),
                  ),
                  elevation: 8,
                  color: Colors.white,
                  shadowColor: Colors.purpleAccent,
                  margin: EdgeInsets.only(left:15,right:15,bottom:25,top:25),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/contact.png",height: 70 ,width:40,color: Colors.pinkAccent,),
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
  _fetch() async{
    final firebaseuser = await FirebaseAuth.instance.currentUser();

    if(firebaseuser!=null){
      await Firestore.instance
          .collection('Student')
          .document(firebaseuser.uid)
          .get()
          .then((ds){
        myEmail=ds.data['Email'];
        name=ds.data['Name'];
      }).catchError((e){
        print(e);
      });
    }
  }
}

