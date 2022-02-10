import 'package:cryptox/constant/constant.dart';
import 'package:cryptox/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        fontFamily: 'Montserrat',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: greyColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
