import 'package:flutter/material.dart';
import 'package:loginsample/Presentations/splash.dart';

const save_Key = "userLoggedIn";
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutterDemo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      // routes: {
      //   "scren_1":(ctx){
      //     return ScreenTwo();
      //   },
      //   "screen_2":(ctx){
      //     return ScreenOne();
      //   }
      // },
    );
  }
}
