import 'package:Anonymous_Hideout/2_Home/6_BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  bool _isEnable = false;
  final FocusNode myFocusNode = FocusNode();
  String username, email, password, cpass;

  Widget userText() {
    return TextFormField(
      enabled: _isEnable,
      initialValue: "testuser",
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
      enabled: _isEnable,
      initialValue: "test@mail.com",
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
      enabled: _isEnable,
      initialValue: "123456",
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
      enabled: _isEnable,
      initialValue: "123456",
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'OpenSansBold')),
        leading: IconButton(
          icon: Icon(Icons.reply, size: 40, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0),
        color: Colors.black,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 180,
                  color: Colors.black,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child:
                            new Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                          'assets/images/as.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 100.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ]),
                      )
                    ],
                  ),
                ),
                new Container(
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 101.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Account',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontFamily: 'OpenSansBold',
                                          color: Colors.purpleAccent[400],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    _status ? _getEditIcon() : new Container(),
                                  ],
                                )
                              ],
                            )),
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
                        !_status ? _getActionButtons() : new Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(context, 4),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 25),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Save",
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSansBold',
                    fontSize: 16,
                  ),
                ),
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    _isEnable = false;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Cancel",
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSansBold',
                    fontSize: 16,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    _isEnable = false;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _isEnable = true;
          _status = false;
        });
      },
    );
  }
}
