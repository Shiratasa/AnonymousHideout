import 'package:flutter/material.dart';
import 'Product.dart';
import 'ProductsRepository.dart';
import 'ProductWidget.dart';
import 'MinimalCart.dart';

String searching;

class GridShop extends StatefulWidget {
  @override
  _GridShop createState() => new _GridShop();
}

class _GridShop extends State<GridShop> {
  List list = ['12', '11'];
  @override
  Widget build(BuildContext context) {
    double _gridSize =
        MediaQuery.of(context).size.height * 0.88; //88% of screen
    double childAspectRatio = MediaQuery.of(context).size.width /
        (MediaQuery.of(context).size.height / 1.0);

    List<Product> _products = new ProductsRepository().fetchAllProducts();

    return new Column(children: <Widget>[
      new AppBar(
        leading: IconButton(
          icon: Icon(Icons.reply, size: 30, color: Colors.greenAccent[400]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        iconTheme: new IconThemeData(color: Colors.greenAccent[400]),
        title: Form(
          child: TextFormField(
            style: TextStyle(
                color: Colors.yellowAccent[400],
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSansRegular',
                fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Input  the  keyword ...',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
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
              if (value.isEmpty) return 'Please  input  any  keyword !';
            },
            onSaved: (String value) {
              searching = value;
            },
          ),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            color: Colors.greenAccent[400],
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
              );
            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {},
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent[400],
                        ),
                        onPressed: () {}),
                    list.length == 0
                        ? new Container()
                        : new Positioned(
                            child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.red),
                              new Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: new Center(
                                    child: new Text(
                                      list.length.toString(),
                                      /* variable */
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'OpenSansRegular',
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      new Container(
          height: _gridSize,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(_gridSize / 10),
                  bottomRight: Radius.circular(_gridSize / 10))),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: new Column(children: <Widget>[
            new Container(
                color: Colors.black,
                child: new Column(children: <Widget>[
                  new Container(
                      height: _gridSize - 88,
                      child: new PhysicalModel(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(_gridSize / 10 - 10),
                              bottomRight:
                                  Radius.circular(_gridSize / 10 - 10)),
                          clipBehavior: Clip.antiAlias,
                          child: new GridView.builder(
                              itemCount: _products.length,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: childAspectRatio),
                              itemBuilder: (BuildContext context, int index) {
                                return new Padding(
                                    padding: EdgeInsets.only(
                                        top: index % 2 == 0 ? 20 : 0,
                                        right: index % 2 == 0 ? 5 : 0,
                                        left: index % 2 == 1 ? 5 : 0,
                                        bottom: index % 2 == 1 ? 20 : 0),
                                    child: ProductWidget(
                                        product: _products[index]));
                              })))
                ]))
          ])),
      new MinimalCart(_gridSize)
    ]);
  }
}
