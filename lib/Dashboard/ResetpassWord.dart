import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 80,
          backgroundColor: Colors.lightBlueAccent,
          elevation: 8,
          shadowColor: Colors.black12,
          title: Text("Reset Password" ,),

        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}

