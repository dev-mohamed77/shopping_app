class LoginAndRegisterModel {
  bool? status;
  String? message;
  Data? data;
  LoginAndRegisterModel.formJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"],
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

  Data(this.id, this.name, this.email, this.phone, this.image, this.point,
      this.credit, this.token);

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
