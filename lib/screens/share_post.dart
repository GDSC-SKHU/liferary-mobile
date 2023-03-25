import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liferary/POST/POST_read/Post_U_Screen.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/widgets/toComentMove.dart';
import 'package:liferary/widgets/toStudyMove.dart';
import 'package:liferary/utilities/palette.dart';
import '../API/authController.dart';
import '../API/postController.dart';
import '../POST/POST_read/post_vote.dart';
import '../Styles/ColorStyles.dart';
import '../Styles/Styles.dart';
import 'MyPage.dart';
import 'login.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key, required this.id});
  final id;

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  late Future<PostModel> psModel;
  final SearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    psModel = PostController.getUserPost(widget.id);
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: getUserId(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var userId = snapshot.data!.email;
          var nickname = snapshot.data!.nickname;

          return Container(
            height: double.infinity,
            child: FutureBuilder(
              future: psModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var title = snapshot.data!.title;
                  var category = snapshot.data!.category;
                  var mainContext = snapshot.data!.context;
                  var user = snapshot.data!.author;
                  var nickName = snapshot.data!.nickname;
                  var images = snapshot.data!.images;
                  print("share_post에서 출력 / 현재 이미지 : ${images}");

                  final List<String> strs =
                      images!.map((e) => e.toString()).toList();
                  // var i = strs[0];
                  // print("${nickname}, ${nickName}");

                  // images = (map['categories'] as List)?.map((item) => item as String)?.toList();
                  // var image = snapshot.data!.;
                  var userToken = storage.read(key: 'Token');

                  return Scaffold(
                    resizeToAvoidBottomInset: true,
                    backgroundColor: Palette.white,
                    body: SafeArea(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            /**게시글 상세 */
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Column(children: [
                                      //logo
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 0, 20, 0),
                                            child: Container(
                                              width: _width * 0.4,
                                              height: _height * 0.04,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/logo.png'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //welcome write
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30, 0, 0, 0),
                                            child: Text(
                                              "Welcome,\nusername!",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Palette.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        width: _width * 0.74,
                                        height: _height * 0.05,
                                        decoration: BoxDecoration(
                                          color: Palette.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Palette.blue, width: 2),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 5, 10),
                                          child: TextField(
                                            controller: SearchController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search),
                                              iconColor: Palette.white,
                                              labelText: 'Search',
                                              labelStyle: TextStyle(
                                                  color: Palette.blue),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 5, 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Palette.blue3,
                                            ),
                                            child: Icon(
                                              Icons.person,
                                              size: _width * 0.135,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyPage()),
                                              );
                                            },
                                          ),
                                        ),

                                        //Logout button
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 20),
                                          child: InkWell(
                                            child: Center(
                                                child: Container(
                                                    width: _width * 0.2,
                                                    height: _height * 0.03,
                                                    decoration: BoxDecoration(
                                                      color: Palette.blue3,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Logout",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Palette.white),
                                                      ),
                                                    ))),

                                            //Logout 버튼 클릭시 네비게이션 작동
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tag : ",
                                              style: TextStyle(
                                                color: Palette.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 0, 15, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("$category",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Palette.blue,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                            nickname == nickName
                                                ? Container(
                                                    child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: (() {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    ((context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '게시글을 수정하시겠습니까?'),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              (() {
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: ((context) => PostUpdateScreen(
                                                                                          id: widget.id,
                                                                                        ))));
                                                                          }),
                                                                          child:
                                                                              Text('수정')),
                                                                      TextButton(
                                                                          onPressed:
                                                                              (() {
                                                                            Navigator.pop(context);
                                                                          }),
                                                                          child:
                                                                              Text('취소'))
                                                                    ],
                                                                  );
                                                                }));
                                                          }),
                                                          icon: Icon(
                                                            Icons.edit,
                                                            color:
                                                                Palette.blue4,
                                                          )),
                                                      IconButton(
                                                          onPressed: (() {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    ((context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '게시글을 삭제하시겠습니까?'),
                                                                    actions: [
                                                                      TextButton(
                                                                          onPressed:
                                                                              (() {
                                                                            deletePost(widget.id);

                                                                            Navigator.push(context,
                                                                                MaterialPageRoute(builder: ((context) => HomeScreen())));
                                                                          }),
                                                                          child:
                                                                              Text('삭제')),
                                                                      TextButton(
                                                                          onPressed:
                                                                              (() {
                                                                            Navigator.pop(context);
                                                                          }),
                                                                          child:
                                                                              Text('취소'))
                                                                    ],
                                                                  );
                                                                }));
                                                          }),
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color:
                                                                Palette.blue4,
                                                          )),
                                                    ],
                                                  ))
                                                : SizedBox(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: _width * 0.95,
                                    height: 3,
                                    color: Palette.blue3,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  /**Title 파트 */
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Title : ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Palette.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '$title',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Palette.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: _width * 0.95,
                                    height: 3,
                                    color: Palette.blue3,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),

                                  /**본문내용 시작 :  First Picture*/
                                  images.isNotEmpty
                                      ? Column(
                                          children: [
                                            // Text("images의 값 : ${strs[0]}"),
                                            // items.addAll(images.toString() as Iterable<String>)
                                            // for (var i in images) {
                                            //   items.append(i);
                                            // },
                                            // Image.network(
                                            //     '${items[0]}', // this image may not exist
                                            //     fit: BoxFit.fill)

                                            CachedNetworkImage(
                                              imageUrl: "${images[0]}",
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color: Palette.white),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                      Icons.person,
                                                      color: Palette.blue2),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: _width * 0.4,
                                          height: _height * 0.3,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/logo.png'),
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: _width * 0.95,
                                    height: 3,
                                    color: Palette.blue3,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  /**본문 내용 */
                                  Container(
                                    width: _width * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Content : ",
                                          style: TextStyle(
                                            color: Palette.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${mainContext}",
                                          style: TextStyle(
                                            color: Palette.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    width: _width * 0.95,
                                    height: 3,
                                    color: Palette.blue3,
                                  ),
                                  SizedBox(
                                    width: 500,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      /**study part*/
                                      toStudyMove(),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      toComentMove(),
                                      SizedBox(
                                        width: 25,
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),

                    /**우측 하단 댓글 아이콘 파트*/
                    // floatingActionButton: FloatingActionButton(
                    //   backgroundColor: ColorStyle.mainColor,
                    //   child: Icon(Icons.message),
                    //   onPressed: () => Navigator.pop(context),
                    //   // {
                    //   // showDialog(
                    //   //     context: context,
                    //   //     barrierDismissible: true,
                    //   //     builder: (BuildContext context) {
                    //   //       return AlertDialog(
                    //   //         alignment: Alignment.center,
                    //   //         title: Text("댓글 작성"),
                    //   //         content: Column(
                    //   //             mainAxisAlignment: MainAxisAlignment.center,
                    //   //             mainAxisSize: MainAxisSize.min,
                    //   //             children: [
                    //   //               TextField(
                    //   //                   controller:
                    //   //                       PostComment.commentController,
                    //   //                   decoration: InputDecoration(
                    //   //                     border: InputBorder.none,
                    //   //                     hintText: '댓글',
                    //   //                     hintStyle: TextStyle(
                    //   //                       color: Colors.black,
                    //   //                     ),
                    //   //                   ))
                    //   //             ]),
                    //   //         actions: [
                    //   //           TextButton(
                    //   //               onPressed: (() {
                    //   //                 PostComment.commentWrite(widget.id);
                    //   //                 Navigator.pop(context);

                    //   //                 setState(() {
                    //   //                   print(widget.id);
                    //   //                   psModel = PostController.getUserPost(
                    //   //                       widget.id);
                    //   //                 });
                    //   //               }),
                    //   //               child: Text(
                    //   //                 '댓글 작성',
                    //   //                 selectionColor: ColorStyle.mainColor,
                    //   //               ))
                    //   //         ],
                    //   //       );
                    //   //     });
                    //   //   PostComment.commentController.clear();
                    //   // },
                    // ),
                  );
                } else {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                      child: CircularProgressIndicator(
                        color: ColorStyle.mainColor,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        }

        /**데이터가 없을 때에는 원로딩 동그라미 그리도록 하라. */
        else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: Palette.blue,
              ),
            ),
          );
        }
      },
    );
  }
}
