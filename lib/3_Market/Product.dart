class Product {
  String _urlToImage;
  String _about;
  String _title;
  double _price;
  double _weight;
  int _id;

  Product(this._urlToImage, this._title, this._price, this._weight, this._id) {
    _about =
        "High performance notebook with many useful features, recommended for every person who wants the quality notebook for work.";
  }

  double get weight => _weight;

  double get price => _price;

  String get title => _title;

  String get urlToImage => _urlToImage;

  int get id => _id;

  String get about => _about;
}
