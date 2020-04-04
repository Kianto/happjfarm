import 'package:flutter/material.dart';

import 'entity.dart';

///
/// class Account extends Entity
///

class Category extends Entity {
  Category({String id, @required this.name})
      : assert(null != name),
        super(id: id);

  Category.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }

  String name;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

}

class ExpandableCategory extends Category {
  ExpandableCategory({String id, String name, this.children})
      : super(id: id, name: name);

  ExpandableCategory.fromJson(Map<String, dynamic> json)
      : super(id: json['id'], name: json['name'])
  {
    List<Map<String, dynamic>> temp = json['children'];
    this.children = temp.map((item) => Category.fromJson(item)).toList();
  }

  List<Category> children = [];
  bool isExpanded = false;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['children'] = this.children.map((item) => item.toJson()).toList();
    return data;
  }

  Category findId(String id) {
    for (var cate in children) {
      if (id == cate.id) return cate;
    }
    return null;
  }

}
