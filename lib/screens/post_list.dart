import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:liferary/widgets/Postlist_preview.dart';
import 'package:liferary/widgets/Prevoius_Next_Button.dart';
import 'package:liferary/widgets/main_posts.dart';

import '../utilities/palette.dart';
import 'home.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListState();
}

class _PostListState extends State<PostListScreen> {
  int _selectedIndex = 1;
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
                      SizedBox(
                        height: 20,
                      ),
                      Postlist_previews(),
                      SizedBox(
                        height: 45,
                      ),
                      Prevoius_Next_Button(),
                      SizedBox(
                        height: 35,
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
