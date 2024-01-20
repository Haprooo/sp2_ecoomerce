class UserInfo {
  String? enName;
  String? arName;
  int? mobile;
  double? rate;
  bool? isLogged;
  Address? address;

  UserInfo(
      {this.enName,
      this.arName,
      this.mobile,
      this.rate,
      this.isLogged,
      this.address});

  UserInfo.fromJson(Map<String, dynamic> json) {
    enName = json['en_name'];
    arName = json['ar_name'];
    mobile = json['mobile'];
    rate = json['rate'];
    isLogged = json['is_logged'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tr_name'] = this.enName;
    data['ar_name'] = this.arName;
    data['mobile'] = this.mobile;
    data['rate'] = this.rate;
    data['is_logged'] = this.isLogged;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? city;
  String? street;

  Address({this.city, this.street});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['street'] = this.street;
    return data;
  }
}
