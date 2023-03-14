import 'package:flutter/material.dart';
import 'package:liferary/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
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
            home: HomeScreen(),
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
