import 'package:flutter/material.dart';
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
    List<String> items = [];
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
                  var images = snapshot.data!.images;
                  // images = (map['categories'] as List)?.map((item) => item as String)?.toList();

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
                                  /*
                    Title Part
                    */
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                        width: _width * 0.8,
                                        height: _height * 0.04,
                                        decoration: BoxDecoration(
                                          color: Palette.blue,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$title',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Palette.white),
                                          ),
                                        )),
                                  ),

                                  /**본문내용 시작 :  First Picture*/
                                  images!.isNotEmpty
                                      ? Column(
                                          children: [
                                            Text("images의 값 : ${images[0]}"),
                                            // items.addAll(images.toString() as Iterable<String>)
                                            // for (var i in images) {
                                            //   items.append(i);
                                            // },

                                            Image.network(
                                                '${images[0]}', // this image may not exist
                                                fit: BoxFit.fill)
                                          ],
                                        )
                                      : SizedBox(
                                          height: 5,
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
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Text(
                                              "${mainContext}",
                                              style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  /**본문 종료 이후 하단 툴 시작**/
                                  //vote part
                                  POST_vote(),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      //study part
                                      //community part
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )
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
