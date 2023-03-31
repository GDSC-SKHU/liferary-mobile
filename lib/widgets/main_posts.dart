import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/screens/share_post.dart';
import 'package:liferary/utilities/palette.dart';

class Main_Postbox extends StatefulWidget {
  const Main_Postbox({super.key});

  @override
  State<Main_Postbox> createState() => _Main_PostboxState();
}

class _Main_PostboxState extends State<Main_Postbox> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      width: _width * 0.45,
                      height: _height * 0.15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Icon.png'),
                          ),
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(color: Palette.blue, width: 3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  1,
                                  1,
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        width: _width * 0.45,
                        height: _height * 0.03,
                        decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "제목",
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "23.03.30",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png')),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/WriteScreen.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/MainScreen.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                /**메인포스트 리스트 위젯 */
                Container(
                  width: _width * 0.75,
                  height: _height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(5.0),
                      // border: Border.all(color: Palette.blue, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: _width * 0.75,
                    height: _height * 0.03,
                    decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(5.0),
                        // border: Border.all(color: Palette.blue, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "yaho0919?",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Palette.blue2,
                          width: 1,
                          height: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "HOW About Riferary?",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Palette.blue2,
                          width: 1,
                          height: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "23.03.30",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ],
    );
  }
}
