import 'package:flutter/material.dart';
import 'package:Anonymous_Hideout/3_Market/7_Explore.dart';
import 'package:Anonymous_Hideout/4_Favor/8_Save.dart';
import 'package:Anonymous_Hideout/6_Chat/10_Inbox.dart';
import 'package:Anonymous_Hideout/7_Account/11_Profile.dart';

BottomNavigationBar CustomBottomNavBar(BuildContext context, int selectedItem) {
  return BottomNavigationBar(
    currentIndex: selectedItem,
    backgroundColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    onTap: (value) {
      _getBody(value, context);
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.greenAccent[400],
        ),
        title: Text(
          "EXPLORE",
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent[400],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.greenAccent[400],
        ),
        title: Text(
          "SAVED",
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent[400],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shop,
          color: Colors.greenAccent[400],
        ),
        title: Text(
          "SHOP",
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent[400],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.message,
          color: Colors.greenAccent[400],
        ),
        title: Text(
          "INBOX",
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent[400],
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.greenAccent[400],
        ),
        title: Text(
          "PROFILE",
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent[400],
          ),
        ),
      )
    ],
  );
}

void _getBody(int index, context) {
  void sorryDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Under  development !"),
            content: Text("This  function  is  not  available  yet,  please  wait  for  the  the  update ..."),
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

  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ExploreScreen()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
      );
      break;
    case 2:
      sorryDialog();
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => SchatScreen()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()),
      );
  }
}
