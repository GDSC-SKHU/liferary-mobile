import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/createstudy.dart';
import 'package:liferary/utilities/palette.dart';

class CreateModal extends StatefulWidget {
  const CreateModal({super.key});

  @override
  State<CreateModal> createState() => _CreateModalState();
}

class _CreateModalState extends State<CreateModal> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: _width * 0.4,
          height: _height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(color: Palette.blue2, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 8,
              ),
              InkWell(
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.school,
                        size: _width * 0.07,
                        color: Palette.blue2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Create study",
                        style: TextStyle(fontSize: 15, color: Palette.blue2),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateStudyScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
