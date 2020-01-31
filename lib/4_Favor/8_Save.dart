import 'package:Anonymous_Hideout/2_Home/6_BottomBar.dart';
import 'package:flutter/material.dart';
import 'CartBloc.dart';
import 'GridShop.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showCart = false;
  CartBloc _cartBloc;

  ScrollController _scrollController = new ScrollController();

  @override
  initState() {
    _scrollController = new ScrollController();
    _cartBloc = new CartBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        body: new Stack(children: <Widget>[
          new CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              slivers: <Widget>[
                new SliverToBoxAdapter(child: new GridShop()),
              ]),
        ]),
        bottomNavigationBar: CustomBottomNavBar(context, 1),
        );
  }

  @override
  void dispose() {
    _cartBloc.dispose();
    super.dispose();
  }
}
