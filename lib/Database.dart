import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_management_system/Profile/profile.dart';

class DatabaseManager {
  final CollectionReference profileList =
  Firestore.instance.collection('Student');

  Future<void> createUserData(
      String name, String gender, int score, String uid) async {
    return await profileList
        .document(uid)
        .setData({'name': name, 'gender': gender, 'score': score});
  }

  Future updateUserList(String name, String gender, int score, String uid) async {
    return await profileList.document(uid).updateData({
      'name': name, 'gender': gender, 'score': score
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await profileList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCurrentUserData() async{
    List CurrentUserList = [];
    try{
      final firebaseuser = await FirebaseAuth.instance.currentUser();
      if(firebaseuser != null){
        await profileList
            .document(firebaseuser.uid)
            .get()
            .then((ds){
              CurrentUserList.add(ds);
        });
      }
      else{
        return null;
      }
      return CurrentUserList;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}