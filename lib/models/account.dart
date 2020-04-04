import 'package:flutter/material.dart';

import 'entity.dart';

///
/// class Account extends Entity
///

class Account extends Entity {
  Account({String id, @required this.email, @required this.password})
      : assert(null != email && email.length > 5),
        super(id: id);

  Account.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.password = json['password'];
    this.email = json['email'];
  }

  String password;
  String email;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }

  bool isValid() {
    if (null == email || email.isEmpty || email.contains(" ") || email.length < 7) {
      return false;
    }
    return true;
  }

}
