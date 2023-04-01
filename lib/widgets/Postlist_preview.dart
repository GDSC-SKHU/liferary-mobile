import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class Postlist_previews extends StatelessWidget {
  const Postlist_previews({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Container(
          width: _width * 0.75,
          height: _height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/smore.png'),
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
                  "yaho0919",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "How to Cook SmoreDeep?",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "23.03.28",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: _width * 0.75,
          height: _height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chicken.png'),
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
                  "yaho0919",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "How to Cook Chicken?",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: _width * 0.75,
          height: _height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lamen.png'),
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
                  "yaho0919",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "How to Cook Ramen?",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "23.03.29",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: _width * 0.75,
          height: _height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rice.png'),
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
                  "yaho0919",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "How to Cook Rice?",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "23.03.29",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 30,
        ),
        Container(
          width: _width * 0.75,
          height: _height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Icon.png'),
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
                  "yaho0919",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "What is Liferary?",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                  "23.03.26",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
