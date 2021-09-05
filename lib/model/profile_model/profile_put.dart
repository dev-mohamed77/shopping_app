class ProfileUpdataModel {
  bool? status;
  String? message;

  ProfileUpdataModel.fromjson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"];
}
