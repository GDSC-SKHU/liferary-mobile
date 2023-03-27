import 'package:flutter/material.dart';
import 'package:liferary/FullView_category/fullview_firstline.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/screens/share_write.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/Prevoius_Next_Button.dart';
import 'package:liferary/widgets/main_posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  TextEditingController inputController = TextEditingController();
  String inputText = '';
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
                      ]),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
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
                          SizedBox(
                            height: 5,
                          ),

                          //Logout button
                          hasAccessToken == true
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
                                  child: Container(
                                      width: _width * 0.2,
                                      height: _height * 0.03,
                                      decoration: BoxDecoration(
                                        color: Palette.blue3,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Palette.white),
                                        ),
                                      )),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  },
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
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          //여백 눌렀을 때 키보드 사라지게 하기.
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: SingleChildScrollView(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
                                  child: SizedBox(
                                    width: _width * 0.78,
                                    height: _height * 0.05,
                                    child: TextField(
                                      controller: inputController,
                                      decoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Search what you want!',
                                        labelStyle:
                                            TextStyle(color: Palette.blue),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 1, color: Palette.blue),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              width: 1, color: Palette.blue),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      inputText = inputController.text;
                                    });
                                  },
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/shuttle.png'),
                                    width: _width * 0.08,
                                    color: Palette.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        hasAccessToken == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Share your knowledge!",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Palette.blue,
                                        fontWeight: FontWeight.bold),
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
                                          builder: (context) =>
                                              Share_writeScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : SizedBox(),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Palette.white,
                        //     shape: CircleBorder(),
                        //     side: BorderSide(
                        //       color: Palette.blue,
                        //       width: 2,
                        //     ),
                        //   ),
                        //   child: Icon(
                        //     Icons.create,
                        //     size: _width * 0.09,
                        //     color: Palette.blue4,
                        //   ),
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => ShareScreen(
                        //           id: 1,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ), //메인 포스트들
                        Main_Postbox(),
                        SizedBox(
                          height: 6,
                        ),
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
