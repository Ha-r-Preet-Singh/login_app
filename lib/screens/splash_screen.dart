
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_sig_up_with_firebase/screens/home_screen.dart';
import 'package:login_sig_up_with_firebase/screens/on%20boading/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOGIN_KEY = "LoggedIn";
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () async {
      var prefs = await SharedPreferences.getInstance();

      var isLogin = prefs.getBool(LOGIN_KEY);

      Widget navigateToPage = LoginScreen();

      if (isLogin != null) {
        if (isLogin) {
          //when true
          navigateToPage = HomeScreen();
        } else {
          navigateToPage = LoginScreen();
        }
      } else {
        navigateToPage = LoginScreen();
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navigateToPage));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
    );
  }
}
