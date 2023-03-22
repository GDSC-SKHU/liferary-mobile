import 'package:flutter/material.dart';
import 'package:liferary/utilities/palette.dart';
import '../API/authController.dart';
import '../API/postController.dart';
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
                                                color: Palette.blue4,
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
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 1,
                                          color: ColorStyle.mainColor,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            '$title',
                                            style: Styles.postHeaderText,
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),

                    /**우측 하단 댓글 아이콘 파트*/
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: ColorStyle.mainColor,
                      child: Icon(Icons.message),
                      onPressed: () => Navigator.pop(context),
                      // {
                      // showDialog(
                      //     context: context,
                      //     barrierDismissible: true,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         alignment: Alignment.center,
                      //         title: Text("댓글 작성"),
                      //         content: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             mainAxisSize: MainAxisSize.min,
                      //             children: [
                      //               TextField(
                      //                   controller:
                      //                       PostComment.commentController,
                      //                   decoration: InputDecoration(
                      //                     border: InputBorder.none,
                      //                     hintText: '댓글',
                      //                     hintStyle: TextStyle(
                      //                       color: Colors.black,
                      //                     ),
                      //                   ))
                      //             ]),
                      //         actions: [
                      //           TextButton(
                      //               onPressed: (() {
                      //                 PostComment.commentWrite(widget.id);
                      //                 Navigator.pop(context);

                      //                 setState(() {
                      //                   print(widget.id);
                      //                   psModel = PostController.getUserPost(
                      //                       widget.id);
                      //                 });
                      //               }),
                      //               child: Text(
                      //                 '댓글 작성',
                      //                 selectionColor: ColorStyle.mainColor,
                      //               ))
                      //         ],
                      //       );
                      //     });
                      //   PostComment.commentController.clear();
                      // },
                    ),
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
