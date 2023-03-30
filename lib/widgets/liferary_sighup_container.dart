import 'package:flutter/material.dart';
import 'package:liferary/utilities/palette.dart';

class SignupContainer extends StatelessWidget {
  const SignupContainer({Key? key, required this.children});

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height * 0.5,
      width: _width * 0.9,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: children),
      decoration: BoxDecoration(
        color: Palette.white,
      ),
    );
  }
}
