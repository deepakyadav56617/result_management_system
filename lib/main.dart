import 'package:flutter/material.dart';
import 'package:result_management_system/Dashboard/Admin_dashboard.dart';
import 'package:result_management_system/Dashboard/Manage_Teacher.dart';
import 'package:result_management_system/Dashboard/Teacher_dashboard.dart';
import 'package:result_management_system/set_up/login.dart';
import 'package:result_management_system/Dashboard/Student_dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Auth.dart';
// import 'Dashboard/UserManagement.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}



