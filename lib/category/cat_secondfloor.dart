import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/category/select_value.dart';

import '../utilities/palette.dart';

class cat_secondfloor extends StatefulWidget {
  const cat_secondfloor({super.key});

  @override
  State<cat_secondfloor> createState() => _cat_secondfloorState();
}

class _cat_secondfloorState extends State<cat_secondfloor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //첫 째줄
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'programming';
                  Navigator.pop(context);
                });
              },
              child: Text('programming',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'language';
                  Navigator.pop(context);
                });
              },
              child: Text('language',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'makeup';
                  Navigator.pop(context);
                });
              },
              child: Text('makeup',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'fashion';
                  Navigator.pop(context);
                });
              },
              child: Text('fashion',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}
