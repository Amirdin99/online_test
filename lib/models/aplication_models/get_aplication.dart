import 'org.dart';
import 'subject.dart';
import 'user.dart';

class GetAplication {
  GetAplication({
      this.id, 
      this.org, 
      this.subject, 
      this.user, 
      this.status, 
      this.state, 
      this.anote,});

  GetAplication.fromJson(dynamic json) {
    id = json['id'];
    org = json['org'] != null ? Org.fromJson(json['org']) : null;
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    status = json['status'];
    state = json['state'];
    anote = json['anote'];
  }
  int? id;
  Org? org;
  Subject? subject;
  User? user;
  String? status;
  String? state;
  String? anote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (org != null) {
      map['org'] = org?.toJson();
    }
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['status'] = status;
    map['state'] = state;
    map['anote'] = anote;
    return map;
  }

}