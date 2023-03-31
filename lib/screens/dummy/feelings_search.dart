import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/dummy/position_screen.dart';

import '../../utilities/palette.dart';

class Feelings_Search extends StatefulWidget {
  const Feelings_Search({super.key});

  @override
  State<Feelings_Search> createState() => _Feelings_SearchState();
}

class _Feelings_SearchState extends State<Feelings_Search> {
  @override
  Widget build(BuildContext context) {
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
                )
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
                      child:
                          //
                          InkWell(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Palette.blue2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'What should I do to get in the correct position?',
                              style: TextStyle(
                                  fontSize: 13,
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
                                  '03/31/2023 00:36',
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
                                  'yaho0919',
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
                            Divider(
                              color: Palette.blue2,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Position_Screen()),
                          );
                        },
                      ),
                      //
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
