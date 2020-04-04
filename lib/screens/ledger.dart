import 'package:flutter/material.dart';
import 'package:happjfarm/collections/farm_collector.dart';
import 'package:happjfarm/models/farm.dart';
import 'package:happjfarm/models/user.dart';
import 'package:happjfarm/utils/constant.dart';
import 'package:happjfarm/widgets/list_item_farm.dart';

import 'farm_info.dart';

class LedgerScreen extends StatefulWidget {
  @override
  _LedgerScreenState createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  List<Farm> _farmItems;

  @override
  Widget build(BuildContext context) {
    _farmItems = _getItemList();
    final String title = (
      null == User.getLoggedUser()
        ? Constants.opt_LoginRequire
        : User.getLoggedUser().isFarmer
          ? Constants.opt_YourFarms
          : Constants.opt_MarkedFarms
    );

    Widget screen = Column(
      children: <Widget>[
        SizedBox(height: 16.0),
        _buildSubtitle(title),

        SizedBox(height: 24.0),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
                children: [
                  _buildItems(this._farmItems),
                  SizedBox(height: 16),
                ]
            ),
          ),
        ),
      ],
    );

    return Scaffold(body: screen);
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: subtitle.length > 25 ? 14 : 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildItems(List<Farm> items) {
    return (items == null && null != User.getLoggedUser())
        ? Text(Constants.empty)
        : ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items == null ? 0 : items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListFarm(farm: items[index], onItemTap: _onItemTap,);
          },
        );
  }

  List<Farm> _getItemList() {
    if (null == User.getLoggedUser()) return null;
    if (User.getLoggedUser().isFarmer)
      // Farmer's farms
      return FarmCollector.getListExample();
    else
      // Trader's liked farm
      return FarmCollector.getListExample();
  }

  void _onItemTap(Farm farm) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return FarmInfoScreen(farm: farm);
        },
      ),
    );
  }

}
