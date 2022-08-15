import 'package:cloud_firestore/cloud_firestore.dart';

class MainViewModel {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  void addMailAddress(String mail, String city) async {
    final CollectionReference mailRef = _database.collection("mailData");
    final CollectionReference idRef = _database.collection("id");
    Map<String, dynamic> addMailAddress = {
      "mail": mail,
      "sehir": city,
    };

    print(idRef.id);
    await mailRef.add(addMailAddress);
  }
}

/*
myyeldeneme@hotmail.com
mehmet1987
 */
