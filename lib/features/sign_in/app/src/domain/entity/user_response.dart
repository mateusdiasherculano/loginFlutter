class UserResponse {
  String? usr;
  String? pwd;

  UserResponse({this.usr, this.pwd});

  UserResponse.fromJson(Map<String, dynamic> json) {
    usr = json['usr'];
    pwd = json['pwd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usr'] = usr;
    data['pwd'] = pwd;
    return data;
  }
}
