import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  SignUpScreen createState() => SignUpScreen();
}

class SignUpScreen extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String username, email, password, cpass;

  void emailDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid  email  address !"),
            content: Text("Invalid  email,  please  input  again !"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void passDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid  password !"),
            content: Text(
                "Your  password  requires  at  least  6  digits,  please  input  again !"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
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
            title: Text("Invalid  confirmation  password !"),
            content: Text(
                "Your  confirmation  password  doesn't  match  with  original  password,  please  input  again !"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
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
            title: Text("Account  creation  successful !"),
            content: Text("Welcome  to  our  community,  '$username' !"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget userText() {
    return TextFormField(
      style: TextStyle(
          color: Colors.yellowAccent[400],
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSansRegular',
          fontSize: 16),
      decoration: InputDecoration(
        icon: Icon(
          Icons.account_circle,
          size: 36.0,
          color: Colors.white,
        ),
        labelText: "USERNAME",
        hintText: 'Input  your  username ...',
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
        if (value.isEmpty) return 'Please  input  your  username !';
      },
      onSaved: (String value) {
        username = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      style: TextStyle(
          color: Colors.yellowAccent[400],
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSansRegular',
          fontSize: 16),
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.white,
        ),
        labelText: "EMAIL",
        hintText: 'Input  your  email ...',
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
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
            "\\@" +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" +
            "\\." +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
            ")+";

        RegExp regExp = RegExp(p);
        if (value.isEmpty) {
          return 'Please  input  your  email !';
        } else if (regExp.hasMatch(value)) {
          return null;
        } else {
          return 'Invalid  email,  please  input  again !';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
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
              image: AssetImage("assets/images/bg4.png"), fit: BoxFit.cover),
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
                    'Sign  Up',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                        fontFamily: 'OpenSansBold'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              userText(),
              SizedBox(
                height: 20,
              ),
              emailText(),
              SizedBox(
                height: 20,
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
                        print(
                            'username = $username, email = $email, password = $password, cpass = $cpass');
                        registerToServer();
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

  Future<void> registerToServer() async {
    if (cpass != password) {
      cpassDialog();
    } else if (cpass == password) {
      String urlString =
          'https://anohide.000webhostapp.com/addData.php?isAdd=true&name=$username&email=$email&pass=$password';
      var response = await get(urlString);
      var result = json.decode(response.body);
      print('result = $result');
      if ((result.toString()) == 'true') {
        Navigator.of(context).pop();
      }
    }
  }
}
