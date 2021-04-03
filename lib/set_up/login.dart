import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result_management_system/set_up/constants.dart';
//import 'package:result_management_system/Dashboard/Admin_dashboard.dart';
//import 'package:result_management_system/Dashboard/Teacher_dashboard.dart';
import 'package:result_management_system/Dashboard/Student_dashboard.dart';
import '../Auth.dart';
import '../Dashboard/Teacher_dashboard.dart';
import '../Dashboard/Admin_dashboard.dart';
import 'package:cupertino_icons/cupertino_icons.dart';


  class LoginScreen extends StatefulWidget {
     @override
    _LoginScreenState createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
     final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String Role;
  @override
  Widget build(BuildContext context) {
  return new WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width:MediaQuery.of(context).size.width,
         height:MediaQuery.of(context).size.height,
        color: Colors.deepPurple,
          child: Center(
           child: Form(
                   key: _key,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 120.0,
                            child: Image.asset(
                              "images/user.png",
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),

                                    Padding(
                                         padding: const EdgeInsets.all(32.0),
                                        child: Column(
                                                  children: [
                                                          SizedBox(height: 30),

                                                         TextFormField(

                                                          controller: _emailContoller,
                                                             validator: (value) {
                                                                   if (value.isEmpty) {
                                                                                    return 'Email cannot be empty';
                                                            } else
                                                                  return null;
                                                            },

                                                           decoration: InputDecoration(
                                                               prefixIcon: Icon(Icons.email),
                                                               border: new OutlineInputBorder(
                                                               borderRadius: new BorderRadius.circular(25.0),
                                                               borderSide: new BorderSide(),
                                                             ),
                                                                 filled: true,
                                                                 fillColor: Colors.deepPurple,
                                                                 labelText: 'Email',
                                                                 labelStyle: TextStyle(color: Colors.white),),
                                                                 style: TextStyle(color: Colors.white),
                                                         ),



                                                       SizedBox(height: 30),


                                                       TextFormField(
                                                                    controller: _passwordController,
                                                                    obscureText: true,
                                                                    validator: (value) {
                                                                      if(value.isEmpty) {
                                                                                return 'Password cannot be empty';
                                                                            } else
                                                                                return null;
                                                                      },
                                                                    decoration: InputDecoration(
                                                                      prefixIcon: Icon(Icons.vpn_key),
                                                                      border: new OutlineInputBorder(
                                                                                  borderRadius: new BorderRadius.circular(25.0),
                                                                                  borderSide: new BorderSide(),
                                                                        ),
                                                                         filled: true,
                                                                         fillColor: Colors.deepPurple,
                                                                         labelText: 'Password',
                                                                         labelStyle: TextStyle(color: Colors.white),),
                                                                         style: TextStyle(color: Colors.white),),

                                                     SizedBox(height: 5),


                                                     Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                               children: [
                                                                       Container(
                                                                            padding: EdgeInsets.symmetric(vertical: 25.0),
                                                                            width: MediaQuery.of(context).size.width * 0.4,

                                                                            child: RaisedButton(

                                                                                     hoverColor: Colors.purpleAccent,
                                                                                     splashColor: Colors.yellow[200],
                                                                                      animationDuration: Duration(seconds: 2),
                                                                                       onPressed: () {
                                                                                        if (_key.currentState.validate()) {
                                                                                                    signInUser();
                                                                                               }
                                                                                         },
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.black),
                                        ),
                                        color: Colors.deepPurple,
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.5,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                          ),
                                        ),
                                      ),
                                    ),
    ],
    ),
                                                    Text(
                                                      'Forgot Password?',
                                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                                    ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
    ),
      ),
    ),
  );
  }

  Future<void> _showMyDialog() async {
       return showDialog<void>(
         context: context,
         barrierDismissible: false, // user must tap button!
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Alert'),
             elevation: 5,

             content: SingleChildScrollView(
               child: ListBody(
                 children: <Widget>[
                   Text('Username/Password not matched'),
                 ],
               ),
             ),
             actions: <Widget>[
               TextButton(
                 child: Text('cancel'),
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
               ),
             ],
           );
         },
       );
     }
  Future signInUser() async {
       dynamic authResult =
       await _auth.loginUser(_emailContoller.text, _passwordController.text);
       if (authResult == null) {
         _emailContoller.clear();
         _passwordController.clear();
          return _showMyDialog();
  } else {
  _emailContoller.clear();
  _passwordController.clear();

  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  if(user !=null) {
    await Firestore.instance.collection('Student')
        .document(user.uid)
        .get()
        .then((value)  {
        setState(() {
          Role = value.data['Role'];
        });
    });
  }

  if(Role == "student"){
             Navigator.push(
                            context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));}
  else if(Role == 'teacher'){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => THomeScreen()));
  }

  else if(Role == 'admin'){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AHomeScreen()));
  }
  else{
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

       }
  }
  }