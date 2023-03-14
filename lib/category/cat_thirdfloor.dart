import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/category/select_value.dart';

import '../utilities/palette.dart';

class cat_thirdfloor extends StatefulWidget {
  const cat_thirdfloor({super.key});

  @override
  State<cat_thirdfloor> createState() => _cat_thirdfloorState();
}

class _cat_thirdfloorState extends State<cat_thirdfloor> {
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
                  ValueManager.selectedValue = 'leisure';
                  Navigator.pop(context);
                });
              },
              child: Text('leisure',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'travel';
                  Navigator.pop(context);
                });
              },
              child: Text('travel',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'etc';
                  Navigator.pop(context);
                });
              },
              child: Text('etc',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
          ],
        ),
      ],
    );
  }
}
