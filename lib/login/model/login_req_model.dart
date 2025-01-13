class LoginReq {
  String? username;
  String? password;
  int? expiresInMins;

  LoginReq({this.username, this.password, this.expiresInMins});

  LoginReq.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String;
    password = json['password'] as String;
    expiresInMins = json['expiresInMins'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['expiresInMins'] = this.expiresInMins;
    return data;
  }
}
