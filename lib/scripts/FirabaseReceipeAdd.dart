import 'package:denemeapp/Screens/DetailScreen.dart';
import 'package:denemeapp/Screens/SelectedCategoryScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:denemeapp/Screens/SearchScreen.dart';

final databaseReference2 = FirebaseDatabase.instance.reference();

class FirebaseQuery with ChangeNotifier {
  searchRecipe(String search) async {
    await FirebaseDatabase.instance
        .reference()
        .child("yemekler")
        .orderByChild("yemekName")
        .equalTo(search)
        .once()
        .then((snap) {
      maplista = snap.value;
    });
    notifyListeners();
  }
}

void createRecord() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  databaseReference2.child("yemekler").child(randomNumeric(15)).set({
    'yemekName': yemekName,
    'malzeme': malzeme,
    'tarif': tarif,
    'rating': rating,
    'category': category,
    'kullaniciID': user.uid,
  });
}

void detailSearchkey(String key) async {
  FirebaseDatabase.instance
      .reference()
      .child('yemekler')
      .orderByKey()
      .equalTo(key)
      .once()
      .then((snap) {
    map = snap.value;
    map.entries.forEach((e) {
      map.values.forEach((v) => map2 = v);
    });
    map2.forEach((k, v) {
      print('{ key: $k, value: $v }');
    });
  });
}

void CategoryList(String categoryName) async {
  FirebaseDatabase.instance
      .reference()
      .child("yemekler")
      .orderByChild("category")
      .equalTo(categoryName)
      .once()
      .then((snap) {
    maplist1 = snap.value;
  });
}

Map<dynamic, dynamic> mapper;
Map<dynamic, dynamic> mapper2;
