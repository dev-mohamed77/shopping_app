class CategoryModel {
  bool? status;
  CategoryData? data;
  CategoryModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data =
            json["data"] != null ? CategoryData.fromJson(json["data"]) : null;
}

class CategoryData {
  List<Data> categoryData = [];

  CategoryData.fromJson(Map<String, dynamic> json) {
    json["data"].forEach((element) {
      categoryData.add(Data.fromJson(element));
    });
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  Data.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        image = json["image"];
}
