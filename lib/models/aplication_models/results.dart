class Results {
  Results({
      this.id, 
      this.org, 
      this.subject, 
      this.user, 
      this.status, 
      this.state, 
      this.anote,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    org = json['org'];
    subject = json['subject'];
    user = json['user'];
    status = json['status'];
    state = json['state'];
    anote = json['anote'];
  }
  int? id;
  int? org;
  int? subject;
  int? user;
  String? status;
  String? state;
  String? anote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['org'] = org;
    map['subject'] = subject;
    map['user'] = user;
    map['status'] = status;
    map['state'] = state;
    map['anote'] = anote;
    return map;
  }

}