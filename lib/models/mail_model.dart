import 'package:cloud_firestore/cloud_firestore.dart';

class MailModel {
  final String mail;
  final int id;
  final String city;

  MailModel({
    required this.mail,
    required this.id,
    required this.city,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "mail": mail,
        "city": city,
      };

  factory MailModel.fromMap(Map map) => MailModel(
        mail: map["mail"],
        id: map["id"],
        city: map["city"],
      );

  factory MailModel.fromDocument(DocumentSnapshot map) => MailModel(
        mail: map["mail"],
        id: map["id"],
        city: map["city"],
      );
}
