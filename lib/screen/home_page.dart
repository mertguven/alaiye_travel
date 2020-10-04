import 'dart:ui';

import 'file:///D:/myapps/flutter_app_test/alaiye_travel/lib/screen/stream/stream_main_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alaiye_travel/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  String search = "";
  String currentLanguage = "turkish";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              //title phase
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      "Alaiye Travel",
                      style: baslikStyle,
                    ),
                    Spacer(flex: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          changeLanguage(currentLanguage, "turkish");
                        });
                      },
                      child: Image.asset(
                        "assets/images/turkey.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Spacer(flex: 1),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          changeLanguage(currentLanguage, "russian");
                        });
                      },
                      child: Image.asset(
                        "assets/images/russia.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Spacer(flex: 1),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          changeLanguage(currentLanguage, "english");
                        });
                      },
                      child: Image.asset(
                        "assets/images/uk.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
              //Search phase
              /*Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Ara",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 10),*/
              //Activities phase
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => StreamMainPage()));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              width: size.width,
                              height: size.height * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/stream.jpg"),
                                ),
                              ),
                            ),
                            Text(
                              "Dim Çayı",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            width: size.width,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/cafe.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "Kafe",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            width: size.width,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/mall.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "AVM",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            width: size.width,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/tour.jpg"),
                              ),
                            ),
                          ),
                          Text(
                            "Turlar",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future changeLanguage(String currentLanguage, String targetLanguage) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("${contentText(currentLanguage, targetLanguage)}"),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    currentLanguage = targetLanguage;
                  });
                  Navigator.pop(context);
                },
                child: Text(
                    "${actionsText(currentLanguage, targetLanguage).first}"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                    "${actionsText(currentLanguage, targetLanguage).last}"),
              ),
            ],
          );
        });
  }

  contentText(String currentLanguage, String targetLanguage) {
    if (currentLanguage == "turkish" && targetLanguage == "russian") {
      return "Rusça diline çevirmek istediğinize emin misiniz?";
    } else if (currentLanguage == "turkish" && targetLanguage == "english") {
      return "İngilizce diline çevirmek istediğinize emin misiniz?";
    } else if (currentLanguage == "english" && targetLanguage == "turkish") {
      return "Are you sure you want to translate into Turkish?";
    } else if (currentLanguage == "english" && targetLanguage == "russian") {
      return "Are you sure you want to translate into Russian?";
    } else if (currentLanguage == "russian" && targetLanguage == "turkish") {
      return "Вы уверены, что хотите перевести это на турецкий?";
    } else if (currentLanguage == "russian" && targetLanguage == "english") {
      return "Вы уверены, что хотите перевести это на английский?";
    }
  }

  List actionsText(String currentLanguage, String targetLanguage) {
    var secim = new List(2);
    switch (currentLanguage) {
      case "turkish":
        secim[0] = "Evet";
        secim[1] = "Hayır";
        break;
      case "english":
        secim[0] = "Yes";
        secim[1] = "No";
        break;
      case "russian":
        secim[0] = "да";
        secim[1] = "нет";
        break;
    }
    return secim;
  }
}
