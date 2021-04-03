import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Current_Sem_Result extends StatefulWidget{

  @override
  _Current_Sem_Result createState()=>_Current_Sem_Result();

}

class _Current_Sem_Result extends State<Current_Sem_Result>{
  final referenceDatabase = FirebaseDatabase.instance;

  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.green,
        title: Text("Current Sem Result" ,style: TextStyle(fontSize: 20,),),
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
          ]

      ),

      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),title:Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back_ios),title:Text("back")),
        ],
      ),
     /*  body: DataTable(
       columns: const<DataColumn>[
         DataColumn(label: Text("Exam")),
         DataColumn(label: Text("Marks Obtained")),
         DataColumn(label: Text("Total Marks")),
       ],
       rows: const<DataRow>[
         DataRow(
             cells: <DataCell>[
               DataCell(Text("Quiz 1")),
               DataCell(Text("-")),
               DataCell(Text("-")),

             ],
         ),

         DataRow(
             cells: <DataCell>[
               DataCell(Text("Quiz 2")),
               DataCell(Text("-")),
               DataCell(Text("-")),

             ],
         ),
       ],),
     */

      body: SingleChildScrollView(

        child: FutureBuilder(
            future: _fetchresult(),
            builder: (context, snapshot) {
              if(snapshot.connectionState != ConnectionState.done)
                return Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 150),
                    child: Column(
                        children: <Widget>[
                          CupertinoActivityIndicator(
                            radius:20,
                          ),
                          Text("Loading Data....",style:TextStyle(fontSize: 26)),
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
                          "Current Sem Result",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.4,

                        ),
                      ),
                    ),
                    ExpansionTile(
                      title: Text(
                        "CS101",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                       children: [
                         SingleChildScrollView(// Op
                           scrollDirection: Axis.horizontal,// tional
                        child: DataTable(
                           columns: const<DataColumn>[
                             DataColumn(label: Text("Exam")),
                             DataColumn(label: Text("Marks Obtained")),
                             DataColumn(label: Text("Total Marks")),
                           ],
                           rows: const<DataRow>[
                             DataRow(
                               cells: <DataCell>[
                                 DataCell(Text("Quiz 1")),
                                 DataCell(Text("list[0]")),
                                 DataCell(Text("-")),

                               ],
                             ),
                           ],),
                         )],
                ),

             ]),
              );
            }
        ),
      ),


    );
   // throw UnimplementedError();
  }
  _fetchresult() async{
    final firebaseuser = await FirebaseAuth.instance.currentUser();

    if(firebaseuser!=null){
      await Firestore.instance
          .collection('Student')
          .document(firebaseuser.uid)
          .get()
          .then((ds){
            list.clear();
                 print(ds.data.values.toString());
                 list.add(ds.data.values.toString());
                    print(list);
                    print(list.length);
      }).catchError((e){
        print(e);
      });
    }
  }
}