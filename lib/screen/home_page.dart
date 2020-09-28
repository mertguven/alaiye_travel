import 'package:flutter/material.dart';
import 'package:alaiye_travel/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textController = TextEditingController();
  String search = "";


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
                      onTap: (){
                        print("turkey");
                      },
                      child: Image.asset(
                        "assets/images/turkey.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Spacer(flex: 1),
                    GestureDetector(
                      onTap: (){
                        print("russia");
                      },
                      child: Image.asset(
                        "assets/images/russia.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Spacer(flex: 1),
                    GestureDetector(
                      onTap: (){
                        print("uk");
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Ara",
                        ),
                        onChanged: (value){
                          setState(() {
                            search = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index){
                  return Card();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
