import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:login_sig_up_with_firebase/screens/home_screen.dart';
import 'package:login_sig_up_with_firebase/screens/on%20boading/sign_up.dart';
import 'package:login_sig_up_with_firebase/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: Text("Login Screen",style: TextStyle(color: Colors.white),),
      //   centerTitle: true,
      //   // actions: [
      //   //   Icon(Icons.more_vert,color:Colors.white,)
      //   // ],
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text(
                  "Log in Screen",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: _loginEmailController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: _loginPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () async {
                      var mLoginEmail = _loginEmailController.text.toString();
                      var mLoginPass = _loginPasswordController.text.toString();

                      try {
                        final credentials = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: mLoginEmail,
                          password: mLoginPass,
                        );
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setBool(LOGIN_KEY, true);


                        if (credentials != null) {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        } else {
                          print("Check Email & Password");
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }

                      // try {
                      //   final credentials =
                      //
                      //   await auth.signInWithEmailAndPassword(
                      //     email: mLoginEmail,
                      //     password: mLoginPass,
                      //   );
                      //
                      //   if (credentials != null) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => HomeScreen(),
                      //         ));
                      //   } else {
                      //     print("Check Email & Password");
                      //   }
                      // } on FirebaseAuthException catch (e) {
                      //   if (e.code == 'user-not-found') {
                      //     print('No user found for that email.');
                      //   } else if (e.code == 'wrong-password') {
                      //     print('Wrong password provided for that user.');
                      //   }
                      // }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget Password??",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Text("Do not have an account")),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
