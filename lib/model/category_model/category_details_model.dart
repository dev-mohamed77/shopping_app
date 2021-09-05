class CategoryDetailsModel {
  bool? status;
  CategoryListData? data;
  CategoryDetailsModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data = json["data"] != null
            ? CategoryListData.fromJson(json["data"])
            : null;
}

class CategoryListData {
  List<CategoryDetailsData> listData = [];
  CategoryListData.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      listData.add(CategoryDetailsData.fromJson(element));
    });
  }
}

class CategoryDetailsData {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  // List<dynamic> images;
  bool? inFavorites;
  bool? inCart;

  CategoryDetailsData.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        price = json["price"],
        oldPrice = json["old_price"],
        discount = json["discount"],
        image = json["image"],
        name = json["name"],
        description = json["description"],
        // images = json["images"],
        inFavorites = json["in_favorites"],
        inCart = json["in_cart"];
}
