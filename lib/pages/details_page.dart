import 'package:flutter/material.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/createstudy_modal.dart';

import '../model/planet_info.dart';
import '../screens/createstudy.dart';

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
                    padding: const EdgeInsets.fromLTRB(32, 30, 32, 0),
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
                        SizedBox(
                          height: 30,
                        ),
                        //본문
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Icon(
                                Icons.more,
                                color: Palette.blue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              planetInfo.category,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Palette.blue2),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //details 본문
                        Text(
                          planetInfo.description,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //하단 갤러리파트
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, bottom: 10),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Palette.blue4),
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
                                /**게시글 생성이후 network부분  assets로 바꾸기*/
                                child: Image.asset(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Divider(
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Youtube',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Palette.blue4),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 300,
                              child: Image.asset(
                                'assets/images/mainpostyoutube.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Divider(
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Study',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Palette.blue4),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'No study has been opened yet!',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        CreateModal(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Divider(
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share your feelings',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Palette.blue4),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'There is no shared feeling yet.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Column(
                          children: [
                            Container(
                              width: _width * 0.56,
                              height: _height * 0.05,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Palette.blue2, width: 1),
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
                                            Icons.psychology_alt,
                                            size: _width * 0.07,
                                            color: Palette.blue2,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Share your feelings",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Palette.blue2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateStudyScreen()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
                child: Hero(
              tag: planetInfo.position,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Palette.white,
                  width: _width,
                  height: _height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Liferary",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Palette.blue4),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: _width * 0.15,
                        child: Image.asset('assets/images/Icon.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )),
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
