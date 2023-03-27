import 'package:flutter/material.dart';
import 'package:liferary/utilities/palette.dart';

import '../model/planet_info.dart';

class DetailsPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailsPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //맨위부터 제목까지 여백
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Palette.blue2),
                          textAlign: TextAlign.left,
                        ),
                        //본문
                        Text(
                          'Solar System',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.amber),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        //details 본문
                        Text(
                          planetInfo.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.amber),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  //하단 갤러리파트
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 10),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          //디테일 뷰 일 때에 하단 갤러리 파트
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                right: 20,
                child: Hero(
                  tag: planetInfo.position,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          planetInfo.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Palette.blue4),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 100,
                          child: Image.asset('assets/images/Icon.png'),
                        ),
                      ],
                    ),
                  ),
                )),
            // Positioned(
            //   left: 32,
            //   top: 60,
            //   child: Text(
            //     planetInfo.position.toString(),
            //     style: TextStyle(
            //       fontSize: 247,
            //       color: Palette.primaryTextColor.withOpacity(0.08),
            //       fontWeight: FontWeight.w900,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            )
          ],
        ),
      ),
    );
  }
}
