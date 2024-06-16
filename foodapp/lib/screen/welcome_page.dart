import 'package:flutter/material.dart';
import 'package:foodapp/screen/login_page.dart';
import 'package:foodapp/screen/sign_up.dart';

class WelcomePage extends StatelessWidget {
  Widget button(
      {@required String name,
      Color color,
      Color textColor,
      @required Function action}) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: action,
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                child: Center(
                  child: Image.asset('images/logo2.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome To Foodie Weee",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(
                          "Order food from our Restaurant and",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Text(
                          "Make Reservation in real-time",
                          style: TextStyle(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                    button(
                      name: 'Login',
                      color: Colors.red,
                      textColor: Colors.black,
                      action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    ),
                    button(
                      name: 'SignUp',
                      color: Colors.yellow,
                      textColor: Colors.black,
                      action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
