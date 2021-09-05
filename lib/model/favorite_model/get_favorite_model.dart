class GetFavoriteModel {
  bool? status;
  FavoriteData? data;

  GetFavoriteModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data =
            json["data"] != null ? FavoriteData.fromJson(json["data"]) : null;
}

class FavoriteData {
  List<Product> listData = [];

  FavoriteData.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      listData.add(Product.fromJson(element));
    });
  }
}

class Product {
  Data? product;
  Product.fromJson(Map<String, dynamic> json)
      : product = Data.fromJson(json["product"]);
}

class Data {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Data.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        oldPrice = json["old_price"],
        discount = json["discount"],
        image = json["image"],
        name = json["name"],
        description = json["description"];
}
