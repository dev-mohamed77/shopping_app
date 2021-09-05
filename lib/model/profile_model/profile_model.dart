class ProfileModel {
  bool? status;
  Data? data;
  ProfileModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        data = json["data"] != null ? Data.fromJasn(json["data"]) : null;
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? point;
  int? credit;
  String? token;

  Data.fromJasn(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        email = json["email"],
        phone = json["phone"],
        image = json["image"],
        point = json["point"],
        credit = json["credit"],
        token = json["token"];
}
