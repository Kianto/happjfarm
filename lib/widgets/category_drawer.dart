import 'package:flutter/material.dart';
import 'package:happjfarm/models/category.dart';
import 'package:happjfarm/utils/constant.dart';

class CategoryDrawer extends StatefulWidget {
  CategoryDrawer({@required this.items, this.onItemTap});

  final List<ExpandableCategory> items;
  final Function(String id) onItemTap;

  @override
  _CategoryDrawerState createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
              DrawerHeader(
                child: Center(
                    child: Text(
                      "Happj Farm Map",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.grey,
                            offset: Offset(5.0, 5.0),
                          ),
                          Shadow(
                            color: Colors.green,
                            blurRadius: 10.0,
                            offset: Offset(-10.0, 5.0),
                          ),
                        ],
                      ),
                    )
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/drawer_bg.jpg"),
                    fit: BoxFit.cover,
                  ),
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Colors.lightGreen[50], Colors.green],
//                    stops: [0.0, 0.5],
//                  )
                ),
              ),
              ListTile(
                leading: Icon(Icons.category,
                    color: Theme.of(context).accentColor),
                title: Text(Constants.category.toUpperCase()),
              ),
              _buildPanel(),
              SizedBox(height: 16.0),
          ],
        )
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.items[index].isExpanded = !isExpanded;
        });
      },
      children: widget.items.map<ExpansionPanel>((ExpandableCategory item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.name),
            );
          },
          body: Column(
            children: item.children
                .map((child) => ListTile(
                      title: Text(child.name),
                      leading: SizedBox(width: 8.0),
                      onTap: () => _childItemTap(child.id),
                    ))
                .toList(),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void _childItemTap(String id) {
    widget.onItemTap(id);
  }
}
