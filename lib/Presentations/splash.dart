import 'package:flutter/material.dart';
import 'package:loginsample/Presentations/loginScreen.dart';
import 'package:loginsample/Presentations/logoutScreen.dart';
import 'package:loginsample/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLogedin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/splash.png",width: 60,height: 60,),),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const LoginScreen()));
  }

  Future<void> checkUserLogedin() async {
    final sharedprfs = await SharedPreferences.getInstance();
    final userLoggedIn = await sharedprfs.getBool(save_Key);
    if (userLoggedIn == null || userLoggedIn == false) {
      goToLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const LogOutScreen()));
    }
  }
}
