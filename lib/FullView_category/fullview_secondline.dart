import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class FullView_secondline extends StatefulWidget {
  const FullView_secondline({super.key});

  @override
  State<FullView_secondline> createState() => _FullView_secondlineState();
}

class _FullView_secondlineState extends State<FullView_secondline> {
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
            Text('relationship',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 20),
            Text('programming',
                style: TextStyle(
                    fontSize: 17,
                    color: Palette.blue4,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: 20),
            Text('language',
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
