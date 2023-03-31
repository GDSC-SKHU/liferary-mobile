import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/Styles/ColorStyles.dart';
import 'package:liferary/Styles/Styles.dart';
import 'package:liferary/mypage_dummy/community_mypage.dart';
import 'package:liferary/mypage_dummy/knowledge_dummy.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

import '../mypage_dummy/study_mypage.dart';
import 'createstudy.dart';
import 'home.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 3;
  void _bottomnavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/postlist');
        break;
      case 2:
        Navigator.pushNamed(context, '/share_write');
        break;
      case 3:
        Navigator.pushNamed(context, '/mypage');
        break;
      case 4:
        Navigator.pushNamed(context, '/settings');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return Future(() => false); //뒤로가기 막음
      },
      child: Scaffold(
          backgroundColor: Palette.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0.0,
            title: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            actions: [
              Row(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      )
                    },
                  ),
                ],
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Palette.blue,
            items: const <TabItem>[
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.format_list_bulleted, title: 'Posts'),
              TabItem(icon: Icons.add, title: 'Publish'),
              TabItem(icon: Icons.person, title: 'My Page'),
              TabItem(icon: Icons.settings, title: 'Settings'),
            ],
            initialActiveIndex: _selectedIndex,
            onTap: _bottomnavigation,
          ),
          body: SafeArea(child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  /**상단 탭 구성 */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: _width * 0.23,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.blue5, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontSize: 15, color: Palette.blue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyPage()),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          width: _width * 0.23,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.blue3, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Knowledge",
                                      style: TextStyle(
                                          fontSize: 15, color: Palette.blue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Knowledge_mypage()),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          width: _width * 0.23,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.blue3, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Study",
                                      style: TextStyle(
                                          fontSize: 15, color: Palette.blue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Study_MypageScreen()),
                          );
                        },
                      ),
                      InkWell(
                        child: Container(
                          width: _width * 0.23,
                          height: _height * 0.09,
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.blue3, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Community",
                                      style: TextStyle(
                                          fontSize: 15, color: Palette.blue2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Community_MypageScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  Container(
                    width: _width * 0.93,
                    height: _height * 0.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Palette.blue5, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "E-mail",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Palette.blue2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "yaho0919@gmail.com",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black38),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Nickname",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Palette.blue2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "yaho0919",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black38),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
            },
          ))),
    );
  }
}
