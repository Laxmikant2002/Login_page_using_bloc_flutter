class LoginResp {
  String? accessToken;
  String? refreshToken;
  String? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;

  LoginResp({
    this.accessToken,
    this.refreshToken,
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  LoginResp.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'] as String?;
    refreshToken = json['refreshToken'] as String?;
    id = json['id'] as String?;
    username = json['username'] as String?;
    email = json['email'] as String?;
    firstName = json['firstName'] as String?;
    lastName = json['lastName'] as String?;
    gender = json['gender'] as String?;
    image = json['image'] as String?;
  }
}
