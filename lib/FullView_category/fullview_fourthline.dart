import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../category/fullview_category.dart';
import '../utilities/palette.dart';

class FullView_fourthline extends StatefulWidget {
  const FullView_fourthline({super.key});

  @override
  State<FullView_fourthline> createState() => _FullView_fourthlineState();
}

class _FullView_fourthlineState extends State<FullView_fourthline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('travel',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 30),
            Text('etc',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
