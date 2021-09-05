class AddCartsModel {
  bool? status;
  String? message;
  AddCartsModel.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"];
}
