import 'package:flutter/material.dart';
import 'package:happjfarm/collections/user_collector.dart';

import 'entity.dart';

///
/// class User extends Entity
///

class User extends Entity {
  User({String id,
    @required this.phone,
    this.name,
    this.address,
    this.idNumber,
    this.isFarmer,
    this.isActivated,
  })
      : assert(null != phone && phone.length > 5),
        super(id: id);

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.idNumber = json['idNumber'];
    this.address = json['address'];
    this.phone = json['phone'];
    this.isFarmer = json['isFarmer'];
    this.isActivated = json['isActivated'];
  }

  String name;
  String idNumber; // CMND - CCCD
  String address;
  String phone; // +xx yyy yyy yyy
  bool isFarmer; // Farmer or Trader
  bool isActivated; // Payed to active

  String get contact {
    String res = "";
    for (int i = 3; i <= phone.length; i += 3) {
      res = res +  " " + phone.substring(i - 3, i);
    }
    return res.trim();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idNumber'] = this.idNumber;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['isFarmer'] = this.isFarmer;
    data['isActivated'] = this.isActivated;
    return data;
  }

  static User _loggedUser;
  static User getLoggedUser() {
    return _loggedUser;
  }
  static User logUser() {
    _loggedUser = UserCollector.getExample();
    return _loggedUser;
  }
  static void outUser() {
    _loggedUser = null;
  }

}
