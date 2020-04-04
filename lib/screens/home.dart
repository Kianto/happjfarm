import 'package:flutter/material.dart';
import 'package:happjfarm/collections/farm_collector.dart';
import 'package:happjfarm/collections/price_filter_collector.dart';
import 'package:happjfarm/collections/standard_collector.dart';
import 'package:happjfarm/models/farm.dart';
import 'package:happjfarm/utils/constant.dart';
import 'package:happjfarm/widgets/grid_item_farm.dart';

import 'farm_info.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Farm> farmItems;
  List<String> standards;
  List<String> priceFilters;

  String selectedStandard;
  String selectedPriceFilter;

  @override
  Widget build(BuildContext context) {
    _getResource();

    Widget screen = Column(
      children: <Widget>[
        SingleChildScrollView(
          child: _buildPanel(),
        ),
        SizedBox(height: 8.0),
        _buildSubtitle(Constants.title_Farm),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ListView(
              children: [
                _buildItems(this.farmItems),
                SizedBox(height: 16),
            ]),
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
        fontSize: 23,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  bool _isExpanded = false;

  Widget _buildPanel() {
    return ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Row(children: [
                  FlatButton(child: Text(Constants.filter), onPressed: () {}),
                ]),
              );
            },
            body: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 24.0, 0),
              child: Column(children: [
                Row(children: [
                  Icon(Icons.star,
                      color: Theme.of(context).accentColor),
                  SizedBox(width: 8.0),
                  Expanded(child: _buildStandardDropDown(this.standards))
                ]),
                Row(children: [
                  Icon(Icons.attach_money,
                      color: Theme.of(context).accentColor),
                  SizedBox(width: 8.0),
                  Expanded(child: _buildPriceFilterDropDown(this.priceFilters))
                ]),
              ]),
            ),
            isExpanded: _isExpanded,
          )
        ]
    );
  }

  Widget _buildStandardDropDown(List<String> standards) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedStandard,
      style: TextStyle(color: Theme.of(context).textTheme.caption.color),
      underline: Container(
        height: 2,
        color: Theme.of(context).accentColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedStandard = newValue;
        });
      },
      items: standards.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildPriceFilterDropDown(List<String> priceFilters) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedPriceFilter,
      style: TextStyle(color: Theme.of(context).textTheme.caption.color),
      underline: Container(
        height: 2,
        color: Theme.of(context).accentColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedPriceFilter = newValue;
        });
      },
      items: priceFilters.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildItems(List<Farm> items) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.25),
      ),
      itemCount: items == null ? 0 : items.length,
      itemBuilder: (BuildContext context, int index) {
        return GridFarm(farm: items[index], onItemTap: _onItemTap,);
      },
    );
  }

  void _getResource() {
    this.farmItems = FarmCollector.getListExample();
    this.standards = StandardCollector.getExample();
    this.priceFilters = PriceFilterCollector.getExample();
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
