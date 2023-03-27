import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:liferary/FullView_category/fullview_firstline.dart';
import 'package:liferary/Styles/ColorStyles.dart';
import 'package:liferary/screens/Mypage.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/screens/share_write.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/Prevoius_Next_Button.dart';
import 'package:liferary/widgets/main_posts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/planet_info.dart';
import '../pages/details_page.dart';
import '../widgets/card.dart';

final bearItem = {
  "list": [
    {"image": "assets/images/img_blue.png", "name": "파랑이"},
    {"image": "assets/images/img_mint.png", "name": "민트트"},
    {"image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"image": "assets/images/img_white.png", "name": "하양이"},
    {"image": "assets/images/img_pink.png", "name": "분홍이"},
    {"image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"image": "assets/images/img_purple.png", "name": "보라라"},
    {"image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
// BearList? bearList;

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
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
          actions: [
            hasAccessToken == true
                ? Row(
                    children: [
                      Text(
                        "yaho0919",
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.login),
                        onPressed: () => {
                          _logout(),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          )
                        },
                      ),
                    ],
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          )
                        },
                      ),
                    ],
                  )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero, // 여백은 필요 없다.
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("yaho0919"),
                accountEmail: Text("yaho0919@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                otherAccountsPictures: [
                  //중복 동그라미 생성 테스트
                  // CircleAvatar(
                  //   backgroundColor: Colors.black,
                  //   backgroundImage: AssetImage('assets/images/logo.png'),
                  // ),
                ],
                onDetailsPressed: () => {
                  // 더보기 화살표를 구현
                  print("clicked")
                },
                decoration: BoxDecoration(
                    color: Palette.blue2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                    )), // 빨간 부분을 꾸미기 위한 기능
              ),
              /**탭바로 내리기로함 */
              // Container(
              //   height: 30,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Palette.white,
              //       shape: CircleBorder(),
              //       side: BorderSide(
              //         color: Palette.blue,
              //         width: 1.5,
              //       ),
              //     ),
              //     child: Icon(
              //       Icons.create,
              //       size: _width * 0.06,
              //       color: Palette.blue4,
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Share_writeScreen(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Choose a category",
                        style: TextStyle(
                            fontSize: 18,
                            color: Palette.blue,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.task_alt,
                        color: Palette.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   height: 1,
                  //   color: Palette.blue,
                  // ),
                ],
              ),

              ListTile(
                leading: Icon(
                  Icons.soup_kitchen,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("cooking"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("fitness"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.mood,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("nonsense"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              //여기까지 3개
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("relationship"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.terminal,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("programming"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("language"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              //6개
              ListTile(
                leading: Icon(
                  Icons.brush,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("makeup"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.headphones,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("music"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.checkroom,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("fashion"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              //9개
              ListTile(
                leading: Icon(
                  Icons.sports_esports,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("leisure"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.flight_takeoff,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("travel"),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
              ListTile(
                leading: Icon(
                  Icons.more,
                  color: Colors.grey[850],
                ), // 화면의 첫 부분
                title: Text("etc..."),
                onTap: () => {print("home!!")},
                // trailing: Icon(Icons.add), // 화면의 끝 부분
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: Palette.white,
        // appBar: AppBar(automaticallyImplyLeading: false),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        /**프리뷰 파트 */
                        //파란 컨테이너
                        Container(
                          width: _width * 1,
                          height: _height * 0.55,
                          color: Palette.blue4,
                          child: Column(children: [
                            Column(
                              children: <Widget>[
                                // const HeaderWidget(),
                                InkWell(
                                  child: SizedBox(
                                    //썸네일 사진과는 상관x
                                    height: _height * 0.53,
                                    child: Swiper(
                                      autoplay: true,
                                      itemCount: planetInfo.length,
                                      itemWidth:
                                          MediaQuery.of(context).size.width,
                                      itemHeight:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      layout: SwiperLayout.TINDER,
                                      //하단 점 6개
                                      pagination: SwiperPagination(
                                          builder: DotSwiperPaginationBuilder(
                                              color: Colors.lightBlueAccent,
                                              activeColor: Colors.white,
                                              activeSize: 12,
                                              space: 4)),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    pageBuilder: (context,
                                                            animation,
                                                            secondaryAnimation) =>
                                                        DetailsPage(
                                                            planetInfo:
                                                                planetInfo[
                                                                    index])));
                                          },
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  CustomCard(
                                                    name:
                                                        planetInfo[index].name,
                                                    category: planetInfo[index]
                                                        .category,
                                                    category_icon:
                                                        planetInfo[index]
                                                            .category_icon,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 25),
                                                //여기가 카드 섹션 이미지 크기
                                                child: Hero(
                                                    tag: planetInfo[index]
                                                        .position,
                                                    child: SizedBox(
                                                      width: _width * 0.5,
                                                      height: _height * 0.32,
                                                      child: Image.asset(
                                                          planetInfo[index]
                                                              .iconImage),
                                                    )),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ), //mypage box end//

                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "More knowledge with more people to share",
                          style: TextStyle(
                              fontSize: 17,
                              color: Palette.blue5,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 15,
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
                                      EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                  child: SizedBox(
                                    width: _width * 0.93,
                                    height: _height * 0.05,
                                    child: TextField(
                                      controller: inputController,
                                      decoration: InputDecoration(
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
                                // ElevatedButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       inputText = inputController.text;
                                //     });
                                //   },
                                //   child: Image(
                                //     image:
                                //         AssetImage('assets/images/shuttle.png'),
                                //     width: _width * 0.08,
                                //     color: Palette.blue,
                                //   ),
                                // ),
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
                        SizedBox(
                          height: 30,
                        ),
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
                        // Main_Postbox(),
                        // SizedBox(
                        //   height: 6,
                        // ),
                        // Prevoius_Next_Button()
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
