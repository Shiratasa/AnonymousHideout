import 'package:flutter/material.dart';
import '../appModel.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class PasswordScreen extends StatefulWidget {
  @override
  SignInScreen createState() => SignInScreen();
}

class SignInScreen extends State<PasswordScreen> {
  final formKey = GlobalKey<FormState>();
  String password, cpass;

  void passDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Invalid  password !"),
            content: new Text(
                "Your  password  requires  at  least  6  digits,  please  input  again !"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void cpassDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Invalid  confirmation  password !"),
            content: new Text(
                "Your  confirmation  password  doesn't  match  with  original  password,  please  input  again !"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget welcomeDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Log - in  successful !"),
            content: new Text("Welcome  back,  '' !"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget passText() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
          color: Colors.yellowAccent[400],
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSansRegular',
          fontSize: 16),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.white,
        ),
        labelText: "PASSWORD  (6  DIGITS  UP)",
        hintText: 'Input  your  password ...',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSansRegular',
            fontSize: 16),
        hintStyle: TextStyle(
            color: Colors.yellowAccent[400],
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSansRegular',
            fontSize: 16),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please  input  your  password !';
        } else if (value.length < 6) {
          return 'Password  too  short,  please  input  again !';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget cpassText() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
          color: Colors.yellowAccent[400],
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSansRegular',
          fontSize: 16),
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.white,
        ),
        labelText: "CONFIRMATION  PASSWORD",
        hintText: 'Input  your  password ...',
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSansRegular',
            fontSize: 16),
        hintStyle: TextStyle(
            color: Colors.yellowAccent[400],
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSansRegular',
            fontSize: 16),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please  input  your  confirmation  password !';
        }
      },
      onSaved: (String value) {
        cpass = value;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[400],
                fontSize: 25,
                fontFamily: 'OpenSansBold')),
        leading: IconButton(
          icon: Icon(Icons.reply, size: 40, color: Colors.greenAccent[400]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg2.png"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    'Reset\nPassword',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[900],
                        fontFamily: 'OpenSansBold'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              passText(),
              SizedBox(
                height: 20,
              ),
              cpassText(),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 0.5),
                  child: FloatingActionButton(
                    backgroundColor: Colors.greenAccent[400],
                    elevation: 0.1,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        print('password = $password, c_password = $cpass');
                        authentication();
                      }
                    },
                    child: Icon(
                      Icons.save,
                      size: 36,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> authentication() async {
    print('Please wait ...');
    String urlString =
        'https://anohide.000webhostapp.com/getUser.php?isAdd=true';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('Authorizing ...');
    if ((result.toString()) == '[]') {
      passDialog();
    } else {
      print('User account: $result');
      for (var myParseJSON in result) {
        UserModel userModel = UserModel.parseJSON(myParseJSON);
        String trueEmail = userModel.email;
      }
    }
  }
}
