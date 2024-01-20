class LoginInfo {
  String? username;
  String? password;
  bool? isCheked;

  LoginInfo({this.username, this.password, this.isCheked});

  LoginInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    isCheked = json['is_cheked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['is_cheked'] = this.isCheked;
    return data;
  }
}
