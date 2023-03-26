import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../category/select_value.dart';
import '../utilities/palette.dart';

class FullView_firstline extends StatefulWidget {
  const FullView_firstline({super.key});

  @override
  State<FullView_firstline> createState() => _FullView_firstlineState();
}

class _FullView_firstlineState extends State<FullView_firstline> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('cooking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('fitness',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('nonsense',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('relationship',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('programming',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('language',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('makeup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('music',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('fashion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('leisure',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('travel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: _width * 0.3,
                height: _height * 0.035,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                    // POINT
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Text('etc...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Palette.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
