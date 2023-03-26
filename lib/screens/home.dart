import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:liferary/API/postController.dart';
import 'package:liferary/FullView_category/fullview_button.dart';
import 'package:liferary/FullView_category/fullview_firstline.dart';
import 'package:liferary/category/left_sentence.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/screens/share_post.dart';
import 'package:liferary/screens/share_write.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/Prevoius_Next_Button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../category/select_value.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<PostList> postListView = listPost(0);
  // var postNumber = 0;
  final SearchController = TextEditingController();
  bool hasAccessToken = false;
  @override
  void initState() {
    super.initState();
    _logintoggle();
  }

  // Future<void> SelectCategory() async {
  //   final select_c = await
  // }

  Future<void> _logintoggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hasAccessToken = prefs.getBool('hasAccessToken') ?? false;
      var nickname = prefs.getString('nickname') ?? "";
    });
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    print(hasAccessToken);
  }

  @override
  Widget build(BuildContext context) {
    // var postLast;
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    // final nickname =
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Palette.white,
        // appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(children: [
                      Column(children: [
                        //logo
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: Palette.blue,
                              width: 10,
                            ),
                            Container(
                              width: _width * 0.4,
                              height: _height * 0.08,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            //welcome write
                            Column(
                              children: [
                                Text(
                                  "Welcome,",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Palette.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "username!",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Palette.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        // Container(
                        //   width: _width * 0.74,
                        //   height: _height * 0.05,
                        //   decoration: BoxDecoration(
                        //     color: Palette.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(color: Palette.blue, width: 2),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                        //     child: TextField(
                        //       controller: SearchController,
                        //       decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         prefixIcon: Icon(Icons.search),
                        //         iconColor: Palette.white,
                        //         labelText: 'Search',
                        //         labelStyle: TextStyle(color: Palette.blue),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Palette.blue3,
                              ),
                              child: Icon(
                                Icons.person,
                                size: _width * 0.1,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyPage()),
                                );
                              },
                            ),
                          ),

                          //Logout button
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            child: hasAccessToken == true
                                ? InkWell(
                                    child: Center(
                                        child: Container(
                                            width: _width * 0.2,
                                            height: _height * 0.03,
                                            decoration: BoxDecoration(
                                              color: Palette.blue3,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Logout",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.white),
                                              ),
                                            ))),
                                    onTap: () {
                                      _logout();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    },
                                  )
                                /**hasaccessToken */
                                : InkWell(
                                    child: Center(
                                        child: Container(
                                            width: _width * 0.2,
                                            height: _height * 0.03,
                                            decoration: BoxDecoration(
                                              color: Palette.blue3,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Login",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.white),
                                              ),
                                            ))),
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
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        //박스 시작
                        Container(
                          width: _width * 1,
                          height: _height * 0.35,
                          color: Palette.blue,
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),

                            //하단
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    //choose part
                                    Text(
                                      "What kind of knowledge do you want to know?",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Palette.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: _width * 0.95,
                                      height: 2,
                                      color: Palette.white,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    //white box
                                    Column(
                                      children: [
                                        FullView_firstline(),
                                        // FullView_Button(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ), //mypage box end//

                        Row(
                          children: [
                            // Padding(
                            //   //selected part
                            //   padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                            //   child: Container(
                            //     alignment: Alignment.centerLeft,
                            //     width: _width * 0.8,
                            //     height: _height * 0.045,
                            //     decoration: BoxDecoration(
                            //       color: Palette.white,
                            //       borderRadius: BorderRadius.circular(10),
                            //       border:
                            //           Border.all(color: Palette.blue, width: 2),
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           width: 10,
                            //         ),
                            //         Text(
                            //           "Selected : ",
                            //           style: TextStyle(
                            //               fontSize: 18,
                            //               color: Palette.blue3,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //         Text(
                            //           "${ValueManager.selectedValue}",
                            //           style: TextStyle(
                            //               fontSize: 18,
                            //               color: Palette.blue4,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: hasAccessToken == true
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Palette.white,
                                        shape: CircleBorder(),
                                        side: BorderSide(
                                          color: Palette.blue,
                                          width: 2,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.create,
                                        size: _width * 0.09,
                                        color: Palette.blue4,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Share_writeScreen(),
                                          ),
                                        );
                                      },
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.white,
                            shape: CircleBorder(),
                            side: BorderSide(
                              color: Palette.blue,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.create,
                            size: _width * 0.09,
                            color: Palette.blue4,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShareScreen(
                                  id: 6,
                                ),
                              ),
                            );
                          },
                        ), //메인 포스트들
                        SizedBox(
                          height: 6,
                        ),
                        /** */
                        Prevoius_Next_Button()
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )));
  }
}
