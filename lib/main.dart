//using phpMyAdmin server: (https://in.000webhost.com/members/website/anohide/build)
//package name: (https://medium.com/@skyblazar.cc/how-to-change-the-package-name-of-your-flutter-app-4529e6e6e6fc)

import 'package:flutter/material.dart';
import 'package:Anonymous_Hideout/1_Regist/3_SignIn.dart';
import 'package:Anonymous_Hideout/1_Regist/2_SignUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

Widget showAppName() {
  return Text(
    '        Welcome  to\nAnonymous  Hideout',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent[400],
        fontFamily: 'OpenSansBold'),
  );
}

Widget showCredit() {
  return Text(
    '--- Anon  Developers  Company ---',
    style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.yellowAccent[400],
        fontFamily: 'OpenSansBold'),
  );
}

Widget showLogo() {
  return Container(
    width: 250.0,
    height: 250.0,
    child: Image.asset('assets/images/N_logo.png'),
  );
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
            ),
            showAppName(),
            showLogo(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .40,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Authen()),
                  );
                },
                color: Colors.white,
                child: Text(
                  "Sign  In",
                  style: TextStyle(
                    color: Colors.purpleAccent[400],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSansBold',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .40,
              height: 50,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.grey[400]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    28.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Register()),
                  );
                },
                child: Text(
                  "Sign  Up",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSansBold',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            showCredit()
          ],
        ),
      ),
    );
  }
}
