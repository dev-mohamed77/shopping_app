class HomeModel {
  bool? status;
  HomeData? data;

  HomeModel.formJson(Map<String, dynamic> json)
      : status = json["status"],
        data = json["data"] != null ? HomeData.fromJson(json["data"]) : null;
}

class HomeData {
  List<Banners> banners = [];
  List<Products> products = [];

  HomeData.fromJson(Map<String, dynamic> json) {
    json["banners"].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
    json["products"].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}

class Banners {
  int? id;
  String? image;
  Banners.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        image = json["image"];
}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<dynamic> images;
  bool? inFavorites;
  bool? inCart;

  Products.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        oldPrice = json["old_price"],
        discount = json["discount"],
        image = json["image"],
        name = json["name"],
        description = json["description"],
        images = json["images"],
        inFavorites = json["in_favorites"],
        inCart = json["in_cart"];
}
