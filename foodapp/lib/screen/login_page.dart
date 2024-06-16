import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:foodapp/screen/sign_up.dart';
import 'package:foodapp/screen/widget/My_text_field.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  RegExp regExp = RegExp(LoginPage.pattern);
  GlobalKey<ScaffoldState> globalkey = GlobalKey<ScaffoldState>();
  UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalkey.currentState.showSnackBar(
          SnackBar(
            content: Text("No user found for that Email "),
          ),
        );
      } else if (e.code == 'wrong-password') {
        globalkey.currentState.showSnackBar(
          SnackBar(
            content: Text("Wrong password provided for that user. "),
          ),
        );
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields are empty"),
      ));
    }

    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is empty"),
      ));
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Email is Invalid. Enter valid Email."),
      ));
      return;
    }

    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password is empty"),
      ));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalkey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: Text(
                "Log-In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                    controller: email, obscureText: false, hintText: 'Email'),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: password,
                  obscureText: true,
                  hintText: 'Password',
                ),
              ],
            ),
            loading
                ? CircularProgressIndicator()
                : Container(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        validation();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              ),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Register Now', style: TextStyle(color: Colors.red))
              ], text: 'New User? ', style: TextStyle(color: Colors.grey))),
            )
          ],
        ),
      ),
    );
  }
}
