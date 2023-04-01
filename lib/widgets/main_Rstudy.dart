import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/dummy/study_examscreen.dart';

import '../utilities/palette.dart';

class Main_Rstudy extends StatefulWidget {
  const Main_Rstudy({super.key});

  @override
  State<Main_Rstudy> createState() => _Main_RstudyState();
}

class _Main_RstudyState extends State<Main_Rstudy> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Recent Study",
              style: TextStyle(
                  color: Palette.blue5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Avenir',
                  fontSize: 30),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(22, 5, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recent study shortcuts",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Palette.blue2,
                ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const Divider(
            color: Palette.blue2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            children: [
              SizedBox(
                width: 3,
              ),
              SizedBox(
                width: _width * 0.17,
                child: Text(
                  "yaho0919",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: Palette.blue2,
                width: 1.5,
                height: 44,
              ),
              SizedBox(
                width: 20,
              ),
              //
              InkWell(
                child: SizedBox(
                  width: _width * 0.52,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's explore how to use Liferary with maximum efficiency.",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            color: Palette.blue5,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Study_ExamScreen()),
                  );
                },
              ),
              //
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const Divider(
            color: Palette.blue2,
          ),
        ),
      ],
    );
  }
}
