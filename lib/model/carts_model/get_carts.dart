class GetCartsModel {
  bool? status;
  Data? data;
  GetCartsModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data = json["data"] != null ? Data.fromJson(json["data"]) : null;
}

class Data {
  List<CartItem> cartsItem = [];
  int? subTotal;
  int? total;
  Data.fromJson(Map<String, dynamic> json) {
    json["cart_items"].forEach((element) {
      cartsItem.add(CartItem.fromJson(element));
    });
    subTotal = json["sub_total"];
    total = json["total"];
  }
}

class CartItem {
  int? quantity;
  Product? product;
  CartItem.fromJson(Map<String, dynamic> json) {
    quantity = json["quantity"];
    product = Product.fromJson(json["product"]);
  }
}

class Product {
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

  Product.fromJson(Map<String, dynamic> json)
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
