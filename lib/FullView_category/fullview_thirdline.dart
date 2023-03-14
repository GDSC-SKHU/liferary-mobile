import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class FullView_thirdline extends StatefulWidget {
  const FullView_thirdline({super.key});

  @override
  State<FullView_thirdline> createState() => _FullView_thirdlineState();
}

class _FullView_thirdlineState extends State<FullView_thirdline> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('makeup',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 30),
            Text('fashion',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 30),
            Text('leisure',
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
