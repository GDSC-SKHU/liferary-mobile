import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liferary/screens/share_post.dart';
import 'package:liferary/utilities/palette.dart';

import '../API/postController.dart';
import '../Styles/ColorStyles.dart';

class Main_Postbox extends StatefulWidget {
  const Main_Postbox({super.key});

  @override
  State<Main_Postbox> createState() => _Main_PostboxState();
}

class _Main_PostboxState extends State<Main_Postbox> {
  Future<PostList> postListView = listPost(0);
  var postNumber = 0;
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    var postLast;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: FutureBuilder(
                future: postListView,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.58,
                          child: ListView.builder(
                              itemCount: snapshot.data!.content!.length,
                              itemBuilder: ((context, index) {
                                var contId = snapshot.data!.content![index].id;
                                var title =
                                    snapshot.data!.content![index].title;
                                var category =
                                    snapshot.data!.content![index].category;
                                var mainContext =
                                    snapshot.data!.content![index].context;
                                var modifiedDate = snapshot
                                    .data!.content![index].modifiedDate
                                    .toString()
                                    .substring(2, 10);

                                return GestureDetector(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 1,
                                          color: ColorStyle.mainColor,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              width: 50,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: Text(
                                                  // typeStringKo(category)
                                                  "카테고리 파트")),
                                          Container(
                                            width: 1,
                                            height: 15,
                                            color: ColorStyle.mainColor,
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              width: 200,
                                              child: Text('${title}')),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('${modifiedDate}'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => ShareScreen(
                                                  id: contId,
                                                ))));
                                  },
                                );
                              })),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorStyle.mainColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_left,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '이전 페이지',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    if (postNumber != 0) {
                                      postNumber = postNumber - 1;
                                      postListView = listPost(postNumber);

                                      print('$postNumber');
                                    } else {
                                      FToast().showToast(
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: ColorStyle.mainColor),
                                              child: Text(
                                                '처음 페이지 입니다.',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                  });
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorStyle.mainColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '다음 페이지',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    if (snapshot.data!.last == false) {
                                      postNumber = postNumber + 1;
                                      postListView = listPost(postNumber);

                                      print('$postNumber');
                                    } else {
                                      FToast().showToast(
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  color: ColorStyle.mainColor),
                                              child: Text(
                                                '마지막 페이지 입니다.',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorStyle.mainColor,
                      ),
                    );
                  }
                }),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ShareScreen(id: contId,)),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                      width: _width * 0.45,
                      height: _height * 0.15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(color: Palette.blue, width: 3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  1,
                                  1,
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        width: _width * 0.45,
                        height: _height * 0.03,
                        decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png')),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.45,
                        height: _height * 0.15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10.0),
                            // border: Border.all(color: Palette.blue, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    1,
                                    1,
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: _width * 0.45,
                          height: _height * 0.03,
                          decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(color: Palette.blue, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1,
                                      1,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
