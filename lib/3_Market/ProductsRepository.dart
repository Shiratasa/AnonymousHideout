import 'Product.dart';

class ProductsRepository {
  List<Product> fetchAllProducts() {
    return [
      new Product("assets/images/nb1.jpg",
          "Asus VivoBook 15 Notebook", 16990, 0, 0),
      new Product("assets/images/nb2.jpg",
          "Acer Swift 3 Notebook", 17330, 0, 1),
      new Product("assets/images/nb3.jpg",
          "Lenovo IdeaPad 330s Notebook", 14990, 0, 2),
      new Product("assets/images/nb4.jpg",
          "Apple MacBook Air (2019)", 35900, 0, 3),
      new Product("assets/images/nb5.jpg",
          "MSI Prestige PS42 Notebook", 26520, 0, 4),
      new Product("assets/images/nb6.jpg",
          "HP OMEN Notebook", 35900, 0, 5),
      new Product("assets/images/nb7.jpg",
          "Dell Inspiron 3476 Notebook", 13440, 0, 6),
    ];
  }
}
