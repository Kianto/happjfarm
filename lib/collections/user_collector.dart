import 'package:happjfarm/models/user.dart';
import 'package:happjfarm/utils/constant.dart';

///
/// Example only
///

class UserCollector {

  static User getExample() {
    return User(id: "000315",
        name: "Thai Duong",
        phone: "+84312773015",
        idNumber: "901233658",
        isFarmer: true,
        isActivated: true,
        address: "Lien Loc, Xa Bang Commune, Chau Duc District, Ba Ria Vung Tau")
    ;
  }

}