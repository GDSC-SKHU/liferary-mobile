import 'package:flutter/material.dart';
import 'package:liferary/screens/MyPage.dart';
import 'package:liferary/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liferary/screens/setting.dart';
import 'package:liferary/screens/share_write.dart';
import 'firebase_options.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// if (Firebase.apps.isEmpty) {
//   Firebase.initializeApp();
// } else {
//   Firebase.app();
// }
//   // await Firebase.initializeApp(
//   //   options: DefaultFirebaseOptions.currentPlatform,
//   // );
//   runApp(const MyApp());
// }

// Future<void> main() async {
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    Firebase.initializeApp();
  } else {
    Firebase.app();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //MARK: THEME MODE IS LIGHT? LIGHT : DARK
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Liferary',
            theme: ThemeData(useMaterial3: true),
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/share_post': (context) => Share_writeScreen(),
              '/share_write': (context) => Share_writeScreen(),
              '/mypage': (context) => MyPage(),
              '/settings': (context) => Settings(),
            },
            // initialRoute: "/setting",
            // routes: {
            //   "/login": (context) => LoginScreen(),
            //   "/home": (context) => HomeScreen(),
            //   "/setting": (context) => SettingScreen()
            // }
          );
        });
  }
}
