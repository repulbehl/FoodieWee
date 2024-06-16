import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screen/home_page.dart';
import 'package:foodapp/screen/welcome_page.dart';
import 'package:foodapp/screen/widget/My_text_field.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  UserCredential userCredential;
  RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user.uid)
          .set({
        'firstname': firstname.text.trim(),
        "lastname": lastname.text.trim(),
        'email': email.text.trim(),
        'userid': userCredential.user.uid,
        'password': password.text.trim(),
      }).then((value) {
        print(FirebaseAuth.instance.currentUser);
        if (FirebaseAuth.instance.currentUser != null)
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e),
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

  void validation() {
    if (firstname.text.trim().isEmpty || firstname.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("firstname is Empty"),
      ));

      return;
    }

    if (lastname.text.trim().isEmpty || lastname.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("lastname is Empty"),
      ));
      return;
    }

    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("email is Empty"),
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
        content: Text("Password is Empty"),
      ));

      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  Widget button(
      {@required String buttonName,
      @required Color color,
      @required Color textColor,
      @required Function ontap}) {
    return Container(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
          ),
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      key: globalKey,
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
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40),

          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(height: 40.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextField(
                  controller: firstname,
                  obscureText: false,
                  hintText: 'Firstname',
                ),
                MyTextField(
                  controller: lastname,
                  obscureText: false,
                  hintText: 'Lastname',
                ),
                MyTextField(
                  controller: email,
                  obscureText: false,
                  hintText: 'Email',
                ),
                MyTextField(
                  controller: password,
                  obscureText: true,
                  hintText: 'Password',
                ),
              ],
            ),
            SizedBox(height: 40.0),
            loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      button(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()));
                        },
                        buttonName: "Cancel",
                        color: Colors.grey,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      button(
                        ontap: () {
                          validation();
                        },
                        buttonName: "Register",
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
