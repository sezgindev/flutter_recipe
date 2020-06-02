import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class ReceipeModel {
  String key;

  String malzeme;
  String tarif;
  String yemekName;
  String category;

  ReceipeModel(this.malzeme, this.tarif, this.yemekName, this.category);

  ReceipeModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        malzeme = snapshot.value["malzeme"],
        tarif = snapshot.value["tarif"],
        yemekName = snapshot.value["yemekName"],
        category = snapshot.value["category"];

  toJson() {
    return {
      "malzeme": malzeme,
      "tarif": tarif,
      "yemekName": yemekName,
      "category": category,
    };
  }
}
