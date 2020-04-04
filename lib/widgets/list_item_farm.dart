import 'package:flutter/material.dart';
import 'package:happjfarm/collections/standard_collector.dart';
import 'package:happjfarm/models/farm.dart';
import 'package:happjfarm/screens/farm_info.dart';
import 'package:happjfarm/utils/constant.dart';

class ListFarm extends StatelessWidget {
  ListFarm({
    Key key,
    @required this.farm,
    this.onItemTap,
  }) : super(key: key);

  final Farm farm;
  final Function(Farm farm) onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage.assetNetwork(
                    fadeInCurve: Curves.bounceIn,
                    placeholder: Constants.imgLoading,
                    image: farm.image.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 6.0,
                top: 3.0,
                child: _buildStandardLogo(farm.standard),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              farm.product,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Text(
              farm.priceVND + " VND/kg",
              style: TextStyle(
                fontSize: 12.0,
              ),
              maxLines: 1,
            ),
          ),

          SizedBox(height: 16.0),
        ],
      ),
      onTap: () => onItemTap(this.farm),
    );
  }

  Widget _buildStandardLogo(String standard) {
    return StandardCollector.getLogoAsset(standard) != null
        ? Image.asset(
      StandardCollector.getLogoAsset(standard),
      width: 40,
      height: 40,
    )
        : SizedBox()
    ;
  }

}
