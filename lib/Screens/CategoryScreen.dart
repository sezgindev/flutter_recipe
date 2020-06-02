import 'package:denemeapp/Screens/SearchScreen.dart';
import 'package:denemeapp/Screens/SelectedCategoryScreen.dart';
import 'package:denemeapp/Screens/addRecipe.dart';
import 'package:denemeapp/Screens/home.dart';
import 'package:denemeapp/scripts/FirabaseReceipeAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const id = "CategoryScreen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0C28),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 70.0),
                      child: GestureDetector(
                        onTap: () {
                          CategoryList("Çorba");
                          Navigator.pushNamed(
                              context, SelectedCategoryScreen.id);
                        },
                        child: Container(
                          child: Image.asset("images/corb.png"),
                          decoration: BoxDecoration(
                            color: Color(0xFFECECEC),
                            border: Border.all(
                              color: Color(0xFFECECEC),
                              width: 10,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          width: 110,
                          height: 110,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CategoryList("AnaYemek");
                        Navigator.pushNamed(context, SelectedCategoryScreen.id);
                      },
                      child: Container(
                        child: Image.asset("images/yemek.png"),
                        decoration: BoxDecoration(
                          color: Color(0xFFECECEC),
                          border: Border.all(
                            color: Color(0xFFECECEC),
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 110.0, top:10.0),
                        child: Text(
                          "      Çorbalar",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text(
                          "Ana Yemekeler",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 70.0),
                      child: GestureDetector(
                        onTap: () {
                          CategoryList("Tatlı");
                          Navigator.pushNamed(
                              context, SelectedCategoryScreen.id);
                        },
                        child: Container(
                          child: Image.asset("images/pasta.png"),
                          decoration: BoxDecoration(
                            color: Color(0xFFECECEC),
                            border: Border.all(
                              color: Color(0xFFECECEC),
                              width: 10,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          width: 110,
                          height: 110,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CategoryList("Tuzlu");
                        Navigator.pushNamed(context, SelectedCategoryScreen.id);
                      },
                      child: Container(
                        child: Image.asset("images/kurabiye.png"),
                        decoration: BoxDecoration(
                          color: Color(0xFFECECEC),
                          border: Border.all(
                            color: Color(0xFFECECEC),
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 130.0,top:10.0),
                        child: Text(
                          "Tatlılar",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text(
                          "Tuzlular",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: Container(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 70.0),
                      child: GestureDetector(
                        onTap: () {
                          CategoryList("Kebap");
                          Navigator.pushNamed(
                              context, SelectedCategoryScreen.id);
                        },
                        child: Container(
                          child: Image.asset("images/kebap.png"),
                          decoration: BoxDecoration(
                            color: Color(0xFFECECEC),
                            border: Border.all(
                              color: Color(0xFFECECEC),
                              width: 10,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          width: 110,
                          height: 110,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        CategoryList("Diğer");
                        Navigator.pushNamed(context, SelectedCategoryScreen.id);
                      },
                      child: Container(
                        child: Image.asset("images/other.png"),
                        decoration: BoxDecoration(
                          color: Color(0xFFECECEC),
                          border: Border.all(
                            color: Color(0xFFECECEC),
                            width: 10,
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 140.0,top:10.0),
                        child: Text(
                          "Kebaplar",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Text(
                          "Diğer    ",
                          style: TextStyle(color: Color(0xFFECECEC)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
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
