import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FlutterSecureStorage storage = FlutterSecureStorage();

// final GoogleSignIn _googleSignIn = GoogleSignIn.standard(scopes: ["email"]);
// final FirebaseAuth _auth = FirebaseAuth.instance;
// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication googleAuth =
//       await googleUser!.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

// Future<UserCredential> signInWithGoogle() async {
//   // 구글 로그인 창을 표시합니다.
//   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//   // 구글 로그인에 성공하면, 구글 사용자 정보를 가져와 Firebase 인증 정보로 교환합니다.
//   final GoogleSignInAuthentication googleAuth =
//       await googleUser!.authentication;
//   final AuthCredential credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//   return await _auth.signInWithCredential(credential);
// }

class SigninController {
  //회원가입 클래스
  TextEditingController emailController =
      TextEditingController(); //emailController
  TextEditingController passwordController =
      TextEditingController(); //Password Controller
  TextEditingController checkedPasswordController =
      TextEditingController(); //repeatedPasswordController
  TextEditingController nicknameController =
      TextEditingController(); //nicknameController
  Future signinUser() async {
    final prefs = await SharedPreferences.getInstance();
    const url = 'http://api-liferary.duckdns.org/api/member/join';
    User userData;
    var data;

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Charset': 'utf-8'},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
          "checkedPassword": checkedPasswordController.text,
          "nickname": nicknameController.text
        }));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print("${response.statusCode}");
      userData = User(
        // id: data[Int(id)],
        email: data["email"],
        nickname: data["nickname"],
      );
      String email = emailController.text;
      String nickname = userData.nickname.toString();

      await prefs.setString('email', email);
      await prefs.setString('nickname', nickname);
      // print(id);
      // print(email);
      print(nickname);
      print(response.body);
      return response.body.isEmpty;
    } else {
      print(response.statusCode);
      return response.body.isEmpty;
    }
  }
}

/**로그인 / 토큰관리 */
class LoginController {
  static TextEditingController emailController =
      TextEditingController(); //usernameController
  static TextEditingController passwordController =
      TextEditingController(); //Password Controller

  static Future<bool> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    const url = 'http://api-liferary.duckdns.org/api/member/login';
    // http.Response response;
    User userData;
    var data;

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json", 'Charset': 'utf-8'},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }));
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print("${response.statusCode}");
      userData = User(
        grantType: data["grantType"],
        accessToken: data["accessToken"],
        refreshToken: data["refreshToken"],
      );
      String accesstoken = userData.accessToken.toString();
      // final storage = await storage.write(key: "access_token", value: userData.accessToken);
      storage.read(key: "access_token");
      String refreshToken = userData.refreshToken.toString();
      String grantType = emailController.text;

      await prefs.setString('grantType', grantType);
      await prefs.setString('accessToken', accesstoken);
      await prefs.setString('refreshToken', refreshToken);
      await prefs.setBool('isLoggedIn', true); // 로그인 여부 저장
      // print(accesstoken);
      // print(refreshToken);
      print(response.body);
      return response.body.isEmpty;
    } else {
      print(response.statusCode);
      return response.body.isEmpty;
    }
  }
}

class GetSharedPreferencesValues {
  Future<String?> getSharedPreferencesValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

class UserTokenList {
  //토큰 받아오는 클래스
  List<User>? userToken;

  UserTokenList({this.userToken});

  UserTokenList.fromJson(Map<String, dynamic> json) {
    if (json['week'] != null) {
      userToken = <User>[];
      json['week'].forEach((v) {
        userToken!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userToken != null) {
      data['week'] = this.userToken!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? grantType;
  String? accessToken;
  String? refreshToken;
  // String? id;
  String? email;
  String? nickname;

  User({
    this.grantType,
    this.accessToken,
    this.refreshToken,
    // this.id,
    this.email,
    this.nickname,
  });
  User.fromJson(Map<String, dynamic> json) {
    grantType = json['grantType'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    // id = json['id'];
    email = json['email'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grantType'] = this.grantType;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    // data['id'] = this.id;
    data['email'] = this.email;
    data['nickname'] = this.nickname;
    return data;
  }
}

Future<getUserStatus> getUserId() async {
  const url = 'http://api-liferary.duckdns.org/api/member/info';
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken') ?? "";
  // print("accessToken : ${accessToken}");
  // http.Response response;

  // String? token = await storage.read(key: accessToken);
  // print("token : ${token}");
  getUserStatus getStatus;

  var response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer ${accessToken}'},
  );

  if (response.statusCode == 200) {
    // print('로그인 성공 정보 ${response.body}');
    var data = json.decode(response.body);
    getStatus = getUserStatus(email: data['email'], nickname: data['nickname']);
    // print('${response.body}');
    return getStatus;
  } else {
    getStatus = getUserStatus(email: 'null', nickname: 'null');
    print('로그인 실패 : 정보 ${response.body}');
    return getStatus;
  }
}

class getUserStatus {
  final String email; //user id
  final String nickname; //user nicname

  getUserStatus({
    required this.email,
    required this.nickname,
  });
}
