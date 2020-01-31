import 'package:flutter/material.dart';
import 'Product.dart';
import 'CartBloc.dart';
import 'Order.dart';

class ProductView extends StatefulWidget {
  final Product product;
  ProductView({Key key, this.product}) : super(key: key);

  @override
  _ProductView createState() => new _ProductView();
}

class _ProductView extends State<ProductView> {
  final CartBloc _cartBloc = new CartBloc();
  int _quantity = 1;
  bool _isFavorited = false;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        appBar: new AppBar(
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
        body: new SafeArea(
            child: new Column(children: <Widget>[
          new Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.73,
              child: new SingleChildScrollView(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    new Center(
                        child: new StreamBuilder(
                            initialData: null,
                            stream: _cartBloc.observableLastOrder,
                            builder: (context, AsyncSnapshot<Order> snapshot) {
                              String tag = snapshot.data == null
                                  ? "tagHero${widget.product.id}"
                                  : "tagHeroOrder${snapshot.data.id}";
                              return new Hero(
                                  tag: tag,
                                  child: new Image.asset(
                                      widget.product.urlToImage,
                                      fit: BoxFit.cover,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4));
                            })),
                    new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: new Text(widget.product.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSansBold',
                              fontSize: 30,
                              color: Colors.white)),
                    ),
                    new Container(
                        margin: EdgeInsets.only(top: 20),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.amber[900]),
                                    borderRadius: BorderRadius.circular(50)),
                                child: new Row(children: <Widget>[
                                  new InkWell(
                                    child: new Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Colors.amber[900],
                                    ),
                                    onTap: _decrement,
                                  ),
                                  new Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: new Text(_quantity.toString(),
                                          style: TextStyle(
                                              fontFamily: 'OpenSansRegular',
                                              fontSize: 20,
                                              color: Colors.amber[900]))),
                                  new InkWell(
                                    child: new Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.amber[900],
                                    ),
                                    onTap: _increment,
                                  ),
                                ]),
                              ),
                              new Text(
                                  "\฿${(widget.product.price * _quantity).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSansRegular',
                                      fontSize: 30,
                                      color: Colors.yellowAccent[400])),
                            ])),
                    new Container(
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("About  the  product:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSansRegular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              new Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: new Text(widget.product.about,
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontFamily: 'OpenSansRegular',
                                          fontSize: 18)))
                            ]))
                  ]))),
          new Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              )
            ]),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.1,
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: (_isFavorited
                        ? Icon(Icons.favorite, size: 40)
                        : Icon(Icons.favorite_border, size: 40)),
                    color: Colors.red,
                    onPressed: _toggleFavorite,
                  ),
                  new SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: new FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      onPressed: () {
                        _cartBloc.addOrderToCart(widget.product, _quantity);
                        Navigator.of(context).pop();
                      },
                      color: Colors.greenAccent[400],
                      child: Text(
                        "Add  to  Cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSansBold',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ]),
          )
        ])));
  }
}
