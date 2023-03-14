import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:liferary/category/select_value.dart';
import 'package:liferary/utilities/palette.dart';

class Category_firstfloor extends StatefulWidget {
  const Category_firstfloor({super.key});

  @override
  State<Category_firstfloor> createState() => _Category_firstfloorState();
}

class _Category_firstfloorState extends State<Category_firstfloor> {
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
                  ValueManager.selectedValue = 'cooking';
                  Navigator.pop(context);
                });
              },
              child: Text('cooking',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'fitness';
                  Navigator.pop(context);
                });
              },
              child: Text('fitness',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'nonsense';
                  Navigator.pop(context);
                });
              },
              child: Text('nonsense',
                  style: TextStyle(
                      fontSize: 13,
                      color: Palette.blue4,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                setState(() {
                  ValueManager.selectedValue = 'relationship';
                  Navigator.pop(context);
                });
              },
              child: Text('relationship',
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
