import 'dart:io';
import 'package:denemeapp/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:denemeapp/Screens/SearchScreen.dart';
import 'package:denemeapp/Screens/CategoryScreen.dart';
import 'package:denemeapp/constants%20and%20drawer/constants.dart';

List<String> options = <String>[
  'AnaYemek',
  'Çorba',
  'Tatlı',
  'Tuzlu',
  'Kebap',
  'Diğer'
];
String dropdownValue = 'AnaYemek';
String yemekName;
String malzeme;
String tarif;
String category;
String rating;
int currentPage = 0;
List<String> malzemeList = List<String>();

class AddRecipe extends StatefulWidget {
  static const id = "AddRecipe";

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background-image.jpg"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xFFECECEC),
                  width: 10,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            Container(
              width: 340,
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0, bottom: 40),
                child: TextFormField(
                  onChanged: (value) {
                    yemekName = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Container(
                width: 340,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      category = dropdownValue;
                    });
                  },
                  style: TextStyle(color: Colors.blue),
                  iconEnabledColor: Colors.white,
                  selectedItemBuilder: (BuildContext context) {
                    return options.map((String value) {
                      return Text(
                        dropdownValue,
                        style: TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          malzeme = value;
                        },
                        maxLines: 10,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Malzemeleri yazınız",
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: new BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: TextFormField(
                  onChanged: (value) {
                    tarif = value;
                  },
                  maxLines: 10,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Tarifi yazınız",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: new BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: RaisedButton(
                  onPressed: () {
                    createRecord();
                    print(malzemeList);
                    malzemeList.clear();
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                  child: Text("Gönder"),
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  20.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.home,
                    size: 40,
                    color: Colors.white,
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CategoryScreen.id);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.format_align_center,
                      size: 35,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 45.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SearchScreen.id);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Icon(
                        Icons.search,
                        size: 45,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AddRecipe.id);
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add,
                    size: 45,
                    color: Colors.white,
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
