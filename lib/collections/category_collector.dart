import 'package:happjfarm/models/category.dart';
import 'package:happjfarm/utils/constant.dart';

///
/// Example only
///

class CategoryCollector {
  static List<ExpandableCategory> getListExample() {
    return [
      ExpandableCategory(id: "0012", name: "Vegetable", children: [
        Category(id: "A012", name: "Sweet Leaf"),
        Category(id: "B012", name: "Leaf Mustard"),
        Category(id: "C012", name: "Broccoli "),
        Category(id: "D012", name: "Beetroot"),
        Category(id: "E012", name: "Sweet Potato Leaves"),
        Category(id: "F012", name: "Centella"),
      ]),
      ExpandableCategory(id: "0053", name: "Fruit", children: [
        Category(id: "A053", name: "Avocado"),
        Category(id: "B053", name: "Pomelo"),
        Category(id: "C053", name: "Orange"),
        Category(id: "D053", name: "Banana"),
        Category(id: "E053", name: "Papaya"),
        Category(id: "F053", name: "Plum"),
        Category(id: "G053", name: "Soursop"),
        Category(id: "H053", name: "Custard Apple"),
        Category(id: "I053", name: "Mangosteen"),
        Category(id: "J053", name: "Jackfruit"),
        Category(id: "K053", name: "Longan"),
        Category(id: "L053", name: "Grape"),
        Category(id: "M053", name: "Guava"),
        Category(id: "N053", name: "Dragon Fruit"),
        Category(id: "O053", name: "Lychee"),
        Category(id: "P053", name: "Mango"),
      ]),
      ExpandableCategory(id: "0067", name: "Seafood", children: [
        Category(id: "A067", name: "Haft-dried Croaker"),
        Category(id: "B067", name: "Sentinel Crab"),
        Category(id: "C067", name: "Squid"),
        Category(id: "D067", name: "Half-dried Squid"),
        Category(id: "E067", name: "Sweet Snail"),
        Category(id: "F067", name: "Scallop"),
        Category(id: "G067", name: "Shrimp"),
      ]),
    ];
  }
}
