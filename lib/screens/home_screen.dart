

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_sig_up_with_firebase/screens/on%20boading/log_in.dart';
import 'package:login_sig_up_with_firebase/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()async{
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool(LOGIN_KEY, false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
          await FirebaseAuth.instance.signOut().then((value)async {

             });



            }, child: Text("Sign out"
                )),
            Text("Home Screen",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.purpleAccent),),
          ],
        ),
      ),
    );
  }
}
