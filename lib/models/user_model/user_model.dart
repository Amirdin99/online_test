class UserModel {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? org;
  String? phone;
  List<String>? permissions;
  String? additionalPhone;
  String? region;
  String? district;
  String? address;

  UserModel(
      {this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.org,
        this.phone,
        this.permissions,
        this.additionalPhone,
        this.region,
        this.district,
        this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    org = json['org'];
    phone = json['phone'];
    permissions = json['permissions'].cast<String>();
    additionalPhone = json['additional_phone'];
    region = json['region'];
    district = json['district'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['org'] = this.org;
    data['phone'] = this.phone;
    data['permissions'] = this.permissions;
    data['additional_phone'] = this.additionalPhone;
    data['region'] = this.region;
    data['district'] = this.district;
    data['address'] = this.address;
    return data;
  }
}