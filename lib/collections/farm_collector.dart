import 'package:happjfarm/models/farm.dart';
import 'package:happjfarm/utils/constant.dart';

///
/// Example only
///

class FarmCollector {

  static String _lazyDescription = "With more than 50 years of farming, applying many types of techniques, we always provide clean and delicious products. Our garden also allows for site visits and pick fruit to try.";
  static List<Farm> getListExample() {
    return [
      getExample(),
      Farm(
        id: "101",
        ownerId: "000315",
        categoryId: "A053",
        product: "Fruit - Avocado",
        description: _lazyDescription,
        standard: Constants.cVietGap,
        price: 100000,
        output: "50 ton/ha",
        image:
        [ "http://bothaiduong.com/thumb1/1366x500/1/upload/sanpham/20171029_183413-3452.jpg",
          "https://scontent.fsgn9-1.fna.fbcdn.net/v/t1.0-9/20526339_324035958021049_4661001482411402409_n.jpg?_nc_cat=110&_nc_sid=cdbe9c&_nc_ohc=9_e1HGnuVAcAX9fUgrq&_nc_ht=scontent.fsgn9-1.fna&oh=c3d18d9e11fcb9ef5a3b68f49ec69269&oe=5EAF8534",
          "https://scontent.fsgn9-1.fna.fbcdn.net/v/t1.0-9/20604352_324038961354082_3676622611208021355_n.jpg?_nc_cat=109&_nc_sid=cdbe9c&_nc_ohc=x_ESwkzO0HMAX9MEPfb&_nc_ht=scontent.fsgn9-1.fna&oh=87731d9c5a9ea11b507619a9a9729704&oe=5EAC63B4",
        ],
        latitude: 10.625408222690185,
        longitude: 106.58872682601213,
      ),
      Farm(
        id: "1015",
        ownerId: "000315",
        categoryId: "C053",
        product: "Fruit - Orange",
        description: _lazyDescription,
        standard: Constants.none,
        price: 25000,
        output: "80 ton/ha",
        image: [
          "http://medianews.netnews.vn/nhanong/archive/images/2017/04/30/143300_v6.jpg",
        ],
        latitude: 10.524588884087926,
        longitude: 106.84843707829714,
      ),
      Farm(
        id: "1017",
        ownerId: "000315",
        categoryId: "I053",
        product: "Fruit - Plum",
        description: _lazyDescription,
        standard: Constants.cUTZ,
        price: 35000,
        output: "50 ton/ha",
        image:
        [ "http://vietsaotravel.com/upload/product/mt6_6851.jpg",
          "http://vietsaotravel.com/upload/product/mt6_6851.jpg",
          "https://scontent.fsgn9-1.fna.fbcdn.net/v/t1.15752-0/p280x280/91979830_1797886017012656_1207021608451964928_n.jpg?_nc_cat=104&_nc_sid=b96e70&_nc_ohc=6INQK5nvC7cAX-v5DVA&_nc_ht=scontent.fsgn9-1.fna&_nc_tp=6&oh=3266967b606817d47a2c420eb99656ee&oe=5EAD9C82",
        ],
        latitude: 11.020697563048147,
        longitude: 106.52454424649477,
      ),
    ];
  }

  static Farm getExample() {
    return Farm(
      id: "01",
      ownerId: "000315",
      categoryId: "A053",
      product: "Fruit - Avocado",
      description: "For more information, please follow this link: http://bothaiduong.com",
      standard: Constants.cGlobalGAP,
      price: 90000,
      output: "70 ton/ha",
      image:
      [ "https://scontent.fsgn9-1.fna.fbcdn.net/v/t1.0-9/20526079_324036001354378_4758203840533906916_n.jpg?_nc_cat=107&_nc_sid=cdbe9c&_nc_ohc=Tb5Ckz_9nsIAX_VqSiB&_nc_ht=scontent.fsgn9-1.fna&oh=5870433b9dfe74a11a077b2c0f82ebd1&oe=5EAF7528",
      "https://scontent.fsgn9-1.fna.fbcdn.net/v/t1.15752-0/p280x280/91499865_568936883743574_165555467248992256_n.jpg?_nc_cat=111&_nc_sid=b96e70&_nc_ohc=zrKpQnffmi0AX8KjYi7&_nc_ht=scontent.fsgn9-1.fna&_nc_tp=6&oh=e31acafe3ad8e1e920a2f5f3a10f4857&oe=5EAFF616",
      "https://scontent.fsgn9-1.fna.fbcdn.net/v/t31.0-8/p720x720/30425302_426077427816901_291036189555756413_o.jpg?_nc_cat=105&_nc_sid=e3f864&_nc_ohc=cdKL7jBSd4oAX9_04GO&_nc_ht=scontent.fsgn9-1.fna&_nc_tp=6&oh=9c3322ea347c0be8df46dae47a46db2c&oe=5EACF314",
      ],
      latitude: 10.90215684131854,
      longitude: 106.81929554790258,
    );
  }

}
