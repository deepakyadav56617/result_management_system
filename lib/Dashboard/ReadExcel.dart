import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:documents_picker/documents_picker.dart';
/*
void main() {
 var file = "sheet1.xlsx";
  var bytes = File(file).readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  for (var table in excel.tables.keys) {
    print(table); //sheet Name
    print(excel.tables[table].maxCols);
    print(excel.tables[table].maxRows);
    for (var row in excel.tables[table].rows) {
      print("$row");
    }
  }

FilePickerResult result = await FilePicker.platform.pickFiles();

if(result != null) {
   PlatformFile file = result.files.first;
   
   print(file.name);
   print(file.bytes);
   print(file.size);
   print(file.extension);
   print(file.path);
} else {
   // User canceled the picker
 }

}
*/

class ReadExcel extends StatefulWidget {
  @override
  _ReadExcelState createState() => _ReadExcelState();
}

class _ReadExcelState extends State<ReadExcel> {


  File file;
  //List<String> path;
  var bytes;
  var excel;
  String path;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Read Excel File"),),

      body:Container(
        child: RaisedButton(
             onPressed: () async{
               File pickerFile = await FilePicker.getFile(
                 allowedExtensions: ['xlsx',],
                 type: FileType.custom
               );
               if(pickerFile != null) {
                 setState(() {
                   file = pickerFile;
                   var bytes = file.readAsBytesSync();
                   var excel = Excel.decodeBytes(bytes);
                   for (var table in excel.tables.keys) {
                     print(table); //sheet Name
                     print(excel.tables[table].maxCols);
                     print(excel.tables[table].maxRows);
                     for (var row in excel.tables[table].rows) {
                       print("$row");
                     }
                   }
                 });
               }
             },
        ) ,
      )
    );
  }
}



