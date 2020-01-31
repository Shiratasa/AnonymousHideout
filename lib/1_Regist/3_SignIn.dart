import '../appModel.dart';
import './4_Email.dart';
import 'package:Anonymous_Hideout/3_Market/7_Explore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  SignInScreen createState() => SignInScreen();
}

class SignInScreen extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  String username, password;

  void userDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid  username !"),
            content: Text(
                "Username  '$username'  not  found,  please  input  again !"),
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
            content: Text("Wrong  account  password,  please  input  again !"),
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
            title: Text("Log - in  successful !"),
            content: Text("Welcome  back,  '$username' !"),
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
        labelText: "PASSWORD",
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
        }
      },
      onSaved: (String value) {
        password = value;
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
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.cover),
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
                    'Sign  In',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent[400],
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
              passText(),
              SizedBox(height: 40),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmailScreen()));
                },
                child: Text(
                  'Forgot  Password ?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[900],
                      fontFamily: 'OpenSansBold'),
                ),
              ),
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
                        print('username = $username, password = $password');
                        authentication();
                      }
                    },
                    child: Icon(
                      Icons.check,
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
        'https://anohide.000webhostapp.com/getUser.php?isAdd=true&name=$username';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('Authorizing ...');
    if ((result.toString()) == '[]') {
      userDialog();
    } else {
      print('User account: $result');
      for (var myParseJSON in result) {
        UserModel userModel = UserModel.parseJSON(myParseJSON);
        String truePassword = userModel.pass;
        if (password == truePassword) {
          var myServiceRoute = MaterialPageRoute(
              builder: (BuildContext context) => ExploreScreen());
          Navigator.of(context).pushAndRemoveUntil(
              myServiceRoute, (Route<dynamic> route) => false);
        } else if (password != truePassword) {
          passDialog();
        }
      }
    }
  }
}
