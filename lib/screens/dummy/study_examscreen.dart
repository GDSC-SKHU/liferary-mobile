import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utilities/palette.dart';

class Study_ExamScreen extends StatefulWidget {
  const Study_ExamScreen({super.key});

  @override
  State<Study_ExamScreen> createState() => _Study_ExamScreenState();
}

class _Study_ExamScreenState extends State<Study_ExamScreen> {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.create,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.delete,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
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
                            'Let\'s explore how to use Liferary with maximum efficiency.',
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
                          Text(
                            'We would like to research and find out how to maximize the efficiency of Liferary. We will conduct an online study using Google Meet every Tuesday to study this topic. \n\nhttps://meet.google.com/kbr-ehzk-gvm',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Palette.black),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            color: Palette.blue2,
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
