import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/dummy/position_afterscreen.dart';

import '../../API/postController.dart';
import '../../utilities/palette.dart';

class Position_Screen extends StatefulWidget {
  const Position_Screen({super.key});

  @override
  State<Position_Screen> createState() => _Position_ScreenState();
}

class _Position_ScreenState extends State<Position_Screen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Palette.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0.0,
          title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
          actions: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "yaho0919",
                  style: TextStyle(
                      fontSize: 14,
                      color: Palette.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        children: [
                          Divider(
                            color: Palette.blue2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'What should I do to get in the correct position?',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Palette.black),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '03/30/2023 14:06',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Palette.black),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '이은지',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Palette.black),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'I did it alone at the gym last time, and my back hurt so much',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Palette.black),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Palette.blue2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'TU V',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Palette.black),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Adjust the height of the bench',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.black),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '03/30/2023 14:36',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Palette.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          Row(
                            children: [
                              Container(
                                width: _width * 0.53,
                                height: _height * 0.06,
                                child: TextField(
                                  style: TextStyle(fontSize: 10),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Palette.blue5),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.blue5, width: 2),
                                      ),
                                      hintText: "Write your comment.",
                                      hintStyle: TextStyle(fontSize: 10)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Palette.blue2, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: InkWell(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Registration",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Palette.blue2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      WritePostController.postWrite();
                                      print(WritePostController
                                          .contextController.text
                                          .toString());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  Position_AfterScreen())));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
