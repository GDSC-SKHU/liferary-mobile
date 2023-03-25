import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utilities/palette.dart';

class toComentMove extends StatefulWidget {
  const toComentMove({super.key});

  @override
  State<toComentMove> createState() => _toComentMoveState();
}

class _toComentMoveState extends State<toComentMove> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          child: Column(
            children: [
              Text(
                "Check out your study!",
                style: TextStyle(
                    color: Palette.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: _width * 0.35,
                height: _height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/votes.png'),
                  ),
                ),
              ),
            ],
          ),
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
