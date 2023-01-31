class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.middleName, 
      this.phone, 
      this.additionalPhone, 
      this.region, 
      this.district, 
      this.address,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    phone = json['phone'];
    additionalPhone = json['additional_phone'];
    region = json['region'];
    district = json['district'];
    address = json['address'];
  }
  int? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;
  dynamic additionalPhone;
  dynamic region;
  dynamic district;
  dynamic address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['middle_name'] = middleName;
    map['phone'] = phone;
    map['additional_phone'] = additionalPhone;
    map['region'] = region;
    map['district'] = district;
    map['address'] = address;
    return map;
  }

}