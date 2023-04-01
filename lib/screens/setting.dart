import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/screens/home.dart';

import '../Styles/Styles.dart';
import '../utilities/palette.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedIndex = 4;
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
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Not Yet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: Palette.blue5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))),
    );
  }
}
