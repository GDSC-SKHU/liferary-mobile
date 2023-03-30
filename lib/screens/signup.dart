import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liferary/API/authController.dart';
import 'package:liferary/screens/login.dart';
import 'package:liferary/utilities/palette.dart';
import 'package:liferary/widgets/liferary_sighup_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String password = '';
  String repeatedPassword = '';
  SigninController signinController = SigninController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
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
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: [
                //email
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    controller: signinController.emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.badge, color: Palette.blue5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.blue5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.blue5, width: 2),
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
                //nickname
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    controller: signinController.nicknameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle, color: Palette.blue5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.blue5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.blue5, width: 2),
                        ),
                        labelText: 'Nick_name',
                        labelStyle: TextStyle(color: Palette.blue5)),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: null,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //password
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    controller: signinController.passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.key, color: Palette.blue5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.blue5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.blue5, width: 2),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Palette.blue5)),
                    keyboardType: TextInputType.multiline,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    controller: signinController.checkedPasswordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.key, color: Palette.blue5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Palette.blue5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Palette.blue5, width: 2),
                        ),
                        labelText: 'Repeated_pw',
                        labelStyle: TextStyle(color: Palette.blue5)),
                    keyboardType: TextInputType.multiline,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),

                //Success button
                GestureDetector(
                  child: Center(
                      child: Container(
                          width: _width * 0.4,
                          height: _height * 0.04,
                          decoration: BoxDecoration(
                            color: Palette.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Success",
                              style:
                                  TextStyle(fontSize: 20, color: Palette.white),
                            ),
                          ))),
                  onTap: () {
                    if (password != repeatedPassword) {
                      fToast.showToast(child: Text('비밀번호를 확인주세요'));
                    }
                    // else if (signinController.emailController == null) {
                    //   fToast.showToast(child: Text('필수항목을 모두 입력해주세요.'));
                    // } else if (signinController.nicknameController == null) {
                    //   fToast.showToast(child: Text('필수항목을 모두 입력해주세요.'));
                    // } else if (signinController.passwordController == null) {
                    //   fToast.showToast(child: Text('필수항목을 모두 입력해주세요.'));
                    // }
                    else {
                      fToast.showToast(child: Text('회원가입에 성공했습니다.'));
                      signinController.signinUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LoginScreen())));
                    }
                  },
                ),
              ]),
            )
          ])),
        ),
      ),
    );
  }
}
