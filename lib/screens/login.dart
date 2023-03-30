import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/screens/home.dart';
import 'package:liferary/screens/signup.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/login_platform.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FToast fToast;
  LoginPlatform _loginPlatform = LoginPlatform.none;
  GoogleSignInAccount? googleUser = null;

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      print(googleUser);
      print('email = ${googleUser.email}');
      print('nickname = ${googleUser.displayName}');
      // print('id = ${googleUser.id}');

      setState(() {
        _loginPlatform = LoginPlatform.google;
      });
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _LoginClear();
  }

  Future<void> _LoginClear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      LoginController.emailController.clear();
      LoginController.passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
          child: Center(
              child: Container(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),

          //email
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
              controller: LoginController.emailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle, color: Palette.blue5),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.blue5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.blue5, width: 2),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Palette.blue5)),
              keyboardType: TextInputType.emailAddress,
              maxLines: null,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: TextField(
              controller: LoginController.passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.password, color: Palette.blue5),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.blue5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Palette.blue5, width: 2),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Palette.blue5)),
              keyboardType: TextInputType.multiline,
              obscureText: true,
            ),
          ),
          SizedBox(height: 30),

          /**Login line */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: IconButton(
                  icon: Image.asset("assets/images/google.png"),
                  iconSize: 2,
                  onPressed: () async {
                    try {
                      signInWithGoogle();
                    } catch (e) {
                      print("error $e");
                    }
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    "Sign up here",
                    style: TextStyle(color: Palette.blue5),
                  )),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            child: Center(
                child: Container(
                    width: _width * 0.4,
                    height: _height * 0.04,
                    decoration: BoxDecoration(
                      color: Palette.blue2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20, color: Palette.white),
                      ),
                    ))),
            onTap: () async {
              // loginController.l
              // oginUser();
              if (await LoginController.loginUser()) {
                fToast.showToast(child: Text('로그인에 실패했습니다. 회원정보를 확인해주세요.'));
                print('login error');
              } else {
                // HomeScreen.hasAccessToken = false;
                // print(HomeScreen.hasAccessToken);

                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.setBool('hasAccessToken', true);
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomeScreen())));
              }
            },
          ),
        ]),
      ))),
    );
  }
}
