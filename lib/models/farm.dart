import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'entity.dart';

///
/// class Farm extends Entity
///

class Farm extends Entity {
  Farm({String id,
    @required this.ownerId,
    this.categoryId,
    this.product,
    this.description,
    this.price,
    this.standard,
    this.output,
    this.image,
    this.latitude,
    this.longitude,
  })
      : super(id: id);

  Farm.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.ownerId = json['ownerId'];
    this.standard = json['standard'];
    this.description = json['description'];
    this.price = (json['price'] as num).toDouble();
    this.product = json['product'];
    this.categoryId = json['categoryId'];
    this.image = json['image'];

    this.latitude = (json['latitude'] as num).toDouble();
    this.longitude = (json['longitude'] as num).toDouble();
  }

  String ownerId;
  String description;
  String categoryId;
  String product; // category - category detail
  List<String> image; // [3] link = ownerId/id/name.jpg
  double price; // vnd/kg
  String standard; // [] <=> link = standards/[].jpg
  String output; // tan/ha - tonnes per hectare
  double latitude;
  double longitude;

  String get priceVND {
    String res = price.toStringAsFixed(0);

    // res = 5000000 (len = 7)
    //   i =    3
    for (int i = res.length - 3; i > 0; i -= 3) {
      res = res.substring(0, i) + '.' + res.substring(i);
    }
    return res;
  }

  LatLng get coordinate {
    return LatLng(latitude, longitude);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product'] = this.product;
    data['categoryId'] = this.categoryId;
    data['standard'] = this.standard;
    data['price'] = this.price;
    data['output'] = this.output;
    data['description'] = this.description;
    data['image'] = this.image;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

}
