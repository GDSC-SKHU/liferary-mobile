import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:liferary/model/planet_info.dart';
import 'package:liferary/utilities/palette.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String category;

  const CustomCard({
    Key? key,
    required this.name,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1000,
                child: Text(
                  name,
                  style: TextStyle(
                      // overflow: TextOverflow.ellipsis,
                      color: Color.fromARGB(255, 77, 119, 218),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Avenir',
                      fontSize: 26),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    category,
                    style: TextStyle(
                        color: Palette.blue4,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Know More",
                    style: TextStyle(
                        color: Palette.blue3,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Ionicons.arrow_forward,
                      color: Palette.blue3,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
