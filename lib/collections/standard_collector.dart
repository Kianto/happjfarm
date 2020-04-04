import 'package:happjfarm/models/account.dart';
import 'package:happjfarm/utils/constant.dart';

///
/// Example only
///

class StandardCollector {

  static List<String> getExample() {
    return [
      Constants.all,
      Constants.cOrganic,
      Constants.cVietGap,
      Constants.cGlobalGAP,
      Constants.cJAS,
      Constants.cUTZ,
      Constants.none,
    ];
  }

  static String getLogoAsset(String standard) {
    switch(standard) {
      case Constants.cOrganic:
        return Constants.logoOrganic;
      case Constants.cVietGap:
        return Constants.logoVietGap;
      case Constants.cGlobalGAP:
        return Constants.logoGlobalGAP;
      case Constants.cJAS:
        return Constants.logoJAS;
      case Constants.cUTZ:
        return Constants.logoUTZ;
      default:
        return null;
    }
  }

}