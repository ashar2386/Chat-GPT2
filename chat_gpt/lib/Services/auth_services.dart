import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String uid;
  DatabaseService({required this.uid});
  final CollectionReference userscollection =
      FirebaseFirestore.instance.collection('Users');

  Future createValue(String email,String password) async {
    return await userscollection.doc(uid).set({
      'email': email,
      'password': password,
    });
  }
}

