import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../category/fullview_category.dart';
import '../utilities/palette.dart';

class FullView_Button extends StatefulWidget {
  const FullView_Button({super.key});

  @override
  State<FullView_Button> createState() => _FullView_ButtonState();
}

class _FullView_ButtonState extends State<FullView_Button> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: _width * 0.3,
          height: _height * 0.03,
          decoration: BoxDecoration(
            color: Palette.blue3,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.south,
                color: Colors.white,
                size: 16,
              ),
              Text(
                "click here!",
                style: TextStyle(fontSize: 16, color: Palette.white),
              ),
            ],
          ),
        ),
        FullView_Modal(),
      ],
    );
  }
}
