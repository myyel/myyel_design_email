import 'package:cloud_firestore/cloud_firestore.dart';

class MainViewModel {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  void addMailAddress() async {
    final CollectionReference mailRef = _database.collection("mailData");
    Map<String, dynamic> addMailAddress = {
      "mail": "mehmetyasinyel@hotmail.com",
    };

    await mailRef.add(addMailAddress);
  }
}

/*
myyeldeneme@hotmail.com
mehmet1987
 */
