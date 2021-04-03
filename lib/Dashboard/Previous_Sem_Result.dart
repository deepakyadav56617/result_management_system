import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Previous_Sem_Result extends StatefulWidget{
  @override
  _Previous_Sem_Result createState()=>_Previous_Sem_Result();

}

class _Previous_Sem_Result extends State<Previous_Sem_Result>{

  List<Map<String,dynamic>> list = [];
  List<String> list3 = [];
  List<String> course_list1 = [];

  String branch;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Semester Result" ,style: TextStyle(fontSize: 20,),),
          actions: <Widget>[
           IconButton(
      icon: Icon(Icons.refresh),
      tooltip: 'Comment Icon',
      iconSize: 26,
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => super.widget));
      }),
    ]),

      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios),
            label:"back",
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: FutureBuilder(
          future: _fetchresult1(),
          builder: (context, snapshot) {
            if(snapshot.connectionState != ConnectionState.done)
             // return Center(child:Text("Loading data..."),);
              return Center(
                child: Container(
                  margin: EdgeInsets.only(top: 150),
                   child: Column(
                     children: <Widget>[
                      CupertinoActivityIndicator(
                    radius:10,
                  ),
                       Text("Loading Data....",style:TextStyle(fontSize: 16)),
                ]),
                ),
              );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height:20.0),
                  ListTile(
                    contentPadding: EdgeInsets.only(bottom: 20),
                    leading: Image.asset('images/notepad.png', height: 30,color: Colors.pinkAccent,),
                  title: Center(
                    child: Text(
                      "Result Summery",
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,

                    ),
                  ),
                  ),
                  ExpansionTile(
                    childrenPadding: EdgeInsets.only(top:10),
                    title: Text(
                      "Semester 1",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    children: <Widget>[

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,// tional
                       child: Table(
                            border: TableBorder.all(),
                           defaultColumnWidth: FixedColumnWidth(120.0),
                           children: [
                              TableRow(children :[
                                Text('Course Name',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center,),
                                Text('Course Code',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('Grades',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('Credit',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                             for(num i=1;i<=list[0].length;i++)
                                 TableRow(children :[
                                  Text(list[0]['Course '+'$i']['Course_name'],style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                  Text(list[0]['Course '+'$i']['Course_code'],style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                  Text(list[0]['Course '+'$i']['Course_grade'],style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                   Text(list[0]['Course '+'$i']['Course_credit'],style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                 ]),
                              /*
                              TableRow(children :[
                                Text('2',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('CS110',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(1),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('3',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('EC101',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(2),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('4',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('EC102',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(3),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('5',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('EC110',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(4),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('6',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('HS101',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(5),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('7',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('MA101',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(6),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),
                              TableRow(children :[
                                Text('8',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text('GE101',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                                Text(list.elementAt(7),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              ]),*/
                            ]
                        ),
                     ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 2",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 3",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                    /*  Table(
                          border: TableBorder.all(),
                          defaultColumnWidth: FixedColumnWidth(120.0),
                          children: [
                            TableRow(children :[
                              Text('SR No.',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center,),
                              Text('Exam Code',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                              Text('Grades',style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                            ]),
                           for( num i=1; i<=course_list1.length;i++)
                             TableRow(children :[
                               Text("$i",style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                               Text(course_list1.elementAt(i-1),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                               Text(list3.elementAt(i-1),style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center),
                             ]),
                          ]
                      ),*/
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 4",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 5",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 6",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 7",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Semester 8",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'No data available'
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),

    );
    //throw UnimplementedError();
  }

_fetchresult1() async{
  final firebaseuser = await FirebaseAuth.instance.currentUser();

  if(firebaseuser!=null){
    await Firestore.instance
        .collection('Student')
        .document(firebaseuser.uid)
        .get()
        .then((ds){
      branch = ds.data['Branch'];
    }).catchError((e){
      print(e);
    });

    await Firestore.instance
        .collection('Student')
        .document(firebaseuser.uid)
        .collection('Sem 1')
        .document(firebaseuser.uid)
        .get()
        .then((ds){
          list.add(ds.data);
          print(list);
          print(list[0].length);
          //print(list.elementAt(0));
    }).catchError((e){
      print(e);
    });
  /*  await Firestore.instance
        .collection('Student')
        .document(firebaseuser.uid)
        .collection('Sem 3')
        .document(firebaseuser.uid)
        .get()
        .then((ds){
        print(branch);
      if(branch == "CSE") {
        course_list1.add("CS201");
        course_list1.add("CS202");
        course_list1.add("CS210");
        course_list1.add("CS221");
        course_list1.add("MA205");
        course_list1.add("HS201");
        course_list1.add("MA203");
        course_list1.add("SC201");
        list3.add(ds.data['CS201']);
        list3.add(ds.data['CS202']);
        list3.add(ds.data['CS210']);
        list3.add(ds.data['CS221']);
        list3.add(ds.data['MA205']);
        list3.add(ds.data['HS201']);
        list3.add(ds.data['MA203']);
        list3.add(ds.data['SC201']);

      }
        if(branch == "ECE"){
          course_list1.add("CS202");
          course_list1.add("EC201");
          course_list1.add("EC241");
          course_list1.add("EC260");
          course_list1.add("HS201");
          course_list1.add("SC201");
          course_list1.add("MA203");
          list3.add(ds.data['CS202']);
          list3.add(ds.data['EC201']);
          list3.add(ds.data['EC241']);
          list3.add(ds.data['EC260']);
          list3.add(ds.data['HS201']);
          list3.add(ds.data['SC201']);
          list3.add(ds.data['MA203']);
        }
        }).catchError((e){
      print(e);
    });*/

  }
}
}
