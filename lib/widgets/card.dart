import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomCard extends StatelessWidget {
  final String name;

  const CustomCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Avenir',
                    fontSize: 50),
                textAlign: TextAlign.left,
              ),
              Text(
                "Solar System",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w400,
                    fontSize: 28),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Know More",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Ionicons.arrow_forward,
                      color: Colors.amber,
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
