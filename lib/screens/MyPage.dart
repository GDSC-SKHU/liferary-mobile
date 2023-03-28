import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/Styles/ColorStyles.dart';
import 'package:liferary/Styles/Styles.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';

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
        Navigator.pushNamed(context, '/share_post');
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
    return Scaffold(
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
                    // HomeScreen _l
                    // _logout(),
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
            TabItem(icon: Icons.format_list_bulleted, title: 'Full View'),
            TabItem(icon: Icons.add, title: 'publish'),
            TabItem(icon: Icons.person, title: 'My Page'),
            TabItem(icon: Icons.settings, title: 'Settings'),
          ],
          initialActiveIndex: _selectedIndex,
          onTap: _bottomnavigation,
        ),
        body: SafeArea(child: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        //박스 시작
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 350,
                          alignment: AlignmentDirectional.topStart,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Palette.blue),
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
                          child: Column(
                            children: [
                              //person icon _ in box
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 130, 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 108,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Palette.blue),
                                  child: Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              //Full name part _ start
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Full name',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "Park",
                                      // '${snapshot.data!.username}',
                                      style: Styles.userPageBodyText,
                                    )),

                                    // SizedBox(
                                    //   height: 20,
                                    // ),

                                    //Telephone part
                                    Container(
                                      child: Text(
                                        'Telephone',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "+82 10-2267-9106",
                                      // '${snapshot.data!.nickname}',
                                      style: Styles.userPageBodyText,
                                    )),

                                    //E-mail part
                                    Container(
                                      child: Text(
                                        'E-mail',
                                        style: Styles.userPageHeaderText,
                                      ),
                                    ),
                                    Container(
                                        // width: 100,
                                        // alignment: Alignment.bottomRight,
                                        child: Text(
                                      "qhr498@naver.com",
                                      // '${snapshot.data!.nickname}',
                                      style: Styles.userPageBodyText,
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ), //mypage box end//
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
