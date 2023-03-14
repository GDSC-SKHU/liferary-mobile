import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/FullView_category/fullview_button.dart';
import 'package:liferary/FullView_category/fullview_firstline.dart';
import 'package:liferary/FullView_category/fullview_fourthline.dart';
import 'package:liferary/FullView_category/fullview_secondline.dart';
import 'package:liferary/FullView_category/fullview_thirdline.dart';
import 'package:liferary/category/left_sentence.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/screens/share_write.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/Prevoius_Next_Button.dart';
import 'package:liferary/widgets/login_platform.dart';
import 'package:liferary/widgets/main_posts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../category/select_value.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchController = TextEditingController();
  bool hasAccessToken = false;
  @override
  void initState() {
    super.initState();
    _logintoggle();
  }

  Future<void> _logintoggle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hasAccessToken = prefs.getBool('hasAccessToken') ?? false;
    });
  }

  Future<void> _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('hasAccessToken', false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
                              child: Container(
                                width: _width * 0.4,
                                height: _height * 0.04,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                              ),
                            ),
                            //welcome write
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: _width * 0.74,
                          height: _height * 0.05,
                          decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Palette.blue, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                            child: TextField(
                              controller: SearchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                iconColor: Palette.white,
                                labelText: 'Search',
                                labelStyle: TextStyle(color: Palette.blue),
                              ),
                            ),
                          ),
                        ),
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

                                    //Logout 버튼 클릭시 네비게이션 작동
                                    onTap: () {
                                      _incrementCounter();
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
                          //
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          //   child: InkWell(
                          //     child: Center(
                          //         child: Container(
                          //             width: _width * 0.2,
                          //             height: _height * 0.03,
                          //             decoration: BoxDecoration(
                          //               color: Palette.blue3,
                          //               borderRadius: BorderRadius.circular(10),
                          //             ),
                          //             child: Center(
                          //               child: Text(
                          //                 "Logout",
                          //                 style: TextStyle(
                          //                     fontSize: 15,
                          //                     color: Palette.white),
                          //               ),
                          //             ))),

                          //     //Logout 버튼 클릭시 네비게이션 작동
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => LoginScreen()),
                          //       );
                          //     },
                          //   ),
                          // ),
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
                          height: _height * 0.65,
                          color: Palette.blue,
                          child: Column(children: [
                            Container(
                              width: _width * 0.9,
                              // color: Palette.black,
                              child: Column(
                                children: [Left_sentence()],
                              ),
                            ),

                            //하단
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    //choose part
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 5),
                                      child: Container(
                                          width: _width * 0.75,
                                          height: _height * 0.04,
                                          decoration: BoxDecoration(
                                            color: Palette.blue3,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Choose your category!",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Palette.white),
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    //white box
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Container(
                                        width: _width * 0.9,
                                        height: _height * 0.34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Palette.white),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.white,
                                                  blurRadius: 2.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(
                                                    1,
                                                    1,
                                                  )),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 20, 0, 0),
                                          child: Column(
                                            children: [
                                              FullView_firstline(),
                                              FullView_secondline(),
                                              FullView_thirdline(),
                                              FullView_fourthline(),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FullView_Button(),
                                                  SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ), //mypage box end//

                        Row(
                          children: [
                            Padding(
                              //selected part
                              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: _width * 0.8,
                                height: _height * 0.045,
                                decoration: BoxDecoration(
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Palette.blue, width: 2),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Selected : ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Palette.blue3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${ValueManager.selectedValue}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Palette.blue4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                        Main_Postbox(), //메인 포스트들
                        SizedBox(
                          height: 10,
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
