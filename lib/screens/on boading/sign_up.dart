


import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/material.dart';
import 'package:login_sig_up_with_firebase/screens/on%20boading/log_in.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text("Sign Up Screen",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          hintText: "User Name",
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone_android_rounded),
                          hintText: "Phone",
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _emailController,
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
                      controller: _passwordController,
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: ()async {
                        // var mUsername = _nameController.text.toString();
                        // var mPhone = _phoneController.text.toString();
                        var mEmail = _emailController.text.toString();
                        var mPassword = _passwordController.text.toString();


                        try {
                     final  credentials =   await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: mEmail,
                            password: mPassword,

                          );
                     if (credentials != null) {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => LoginScreen(),
                           ));
                     } else {
                       print("Check Email & Password");
                     }




                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }


                        //
                        // try {
                        //   // if (_formKey.currentState!.validate()) {
                        //     await   auth
                        //         .createUserWithEmailAndPassword(
                        //         email: mEmail, password: mPassword)
                        //         .then((value) {
                        //       print("Account created!!");
                        //
                        //
                        //     });
                        //   // }
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'weak-password') {
                        //     print('The password provided is too weak.');
                        //   } else if (e.code == 'email-already-in-use') {
                        //     print('The account already exists for that email.');
                        //   }
                        // } catch (e) {
                        //   print(e);
                        // }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(child: Text("Already have an account??")),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
