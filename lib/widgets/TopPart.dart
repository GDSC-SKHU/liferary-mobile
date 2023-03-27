import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/MyPage.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../utilities/palette.dart';

class TopPart extends StatefulWidget {
  const TopPart({super.key});

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
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

  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Row(children: [
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
                MaterialPageRoute(builder: (context) => MyPage()),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style:
                                  TextStyle(fontSize: 15, color: Palette.white),
                            ),
                          ))),
                  onTap: () {
                    _logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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
                          style: TextStyle(fontSize: 15, color: Palette.white),
                        ),
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
        ],
      )
    ]);
  }
}
