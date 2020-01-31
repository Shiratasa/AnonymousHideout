import 'package:flutter/material.dart';
import 'package:Anonymous_Hideout/2_Home/6_BottomBar.dart';
import 'Home.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
String searching;

class ExploreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new home();
}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

class home extends State<ExploreScreen> {
  List list = ['12', '11'];

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'assets/images/coms.jpg',
      title: 'Computer  Hardwares',
    ),
    Photo(
      assetName: 'assets/images/tools.jpg',
      title: 'Accessory  Tools',
    ),
    Photo(
      assetName: 'assets/images/clothes.jpg',
      title: 'Clothes  &  Fashions',
    ),
    Photo(
      assetName: 'assets/images/beauty.jpg',
      title: 'Health  &  Beauty  Cares',
    ),
    Photo(
      assetName: 'assets/images/furnitures.jpg',
      title: 'Household  Furnitures',
    ),
    Photo(
      assetName: 'assets/images/books.jpg',
      title: 'Books',
    ),
  ];

  final List<String> items = ['Balbhadra', 'Maulik', 'Roshi'];
  static const double height = 366.0;
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline
        .copyWith(color: Colors.black54, fontFamily: 'OpenSansRegular');
    final TextStyle descriptionStyle = theme.textTheme.subhead
        .copyWith(color: Colors.black54, fontFamily: 'OpenSansRegular');
    ShapeBorder shapeBorder;

    return Scaffold(
      appBar: AppBar(
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
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            /* add something */
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: new Column(children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 7.0),
              child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {},
                      child: new Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.purpleAccent[400],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSansBold'),
                      ),
                    ),
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {},
                      child: new Text(
                        'Populars',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSansRegular'),
                      ),
                    ),
                    _verticalD(),
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {},
                          child: new Text(
                            'Newcomers',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSansRegular'),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            new Container(
              alignment: Alignment.topCenter,
              height: 550.0,
              child: new GridView.builder(
                  itemCount: photos.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyHomePage()));
                        },
                        child: new Container(
                            margin: EdgeInsets.all(5.0),
                            child: new Card(
                              shape: shapeBorder,
                              elevation: 3.0,
                              child: new Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 152.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                              child: Image.asset(
                                            photos[index].assetName,
                                            fit: BoxFit.cover,
                                          )),
                                          Container(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 3.0, bottom: 3.0),
                                            alignment: Alignment.bottomLeft,
                                            child: new GestureDetector(
                                              onTap: () {},
                                              child: new Text(
                                                photos[index].title,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontFamily:
                                                        'OpenSansRegular',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  }),
            )
          ]),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(context, 0),
    );
  }

  Icon keyloch = new Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );
}
