import 'package:cloud_firestore/cloud_firestore.dart';

class IdModel {
  final int id;

  IdModel(
    this.id,
  );

  Map<String, dynamic> toMap() => {
        "id": id,
      };

  factory IdModel.fromMap(Map map) => IdModel(
        map["id"],
      );

  factory IdModel.fromDocument(DocumentSnapshot map) => IdModel(
        map["id"],
      );
}
