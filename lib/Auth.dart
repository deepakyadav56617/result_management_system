import 'package:firebase_auth/firebase_auth.dart';
import 'Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'set_up/login.dart';
import 'package:result_management_system/Dashboard/Student_dashboard.dart';
import 'package:result_management_system/Dashboard/Teacher_dashboard.dart';
import 'package:result_management_system/Dashboard/Admin_dashboard.dart';

class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

// registration with email and password
  Future createNewUser(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
     // await Firestore.instance.collection(name, 'Male', 100, user.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

// sign with email and password

  Future loginUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

// signout

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}