import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happjfarm/collections/category_collector.dart';
import 'package:happjfarm/screens/home.dart';
import 'package:happjfarm/screens/ledger.dart';
import 'package:happjfarm/screens/map.dart';
import 'package:happjfarm/screens/personal.dart';
import 'package:happjfarm/utils/constant.dart';
import 'package:happjfarm/widgets/category_drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
//          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(Constants.appName,
            style: TextStyle(
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
                ]
              )
            ),
//          backgroundColor: Theme.of(context).accentColor,
          elevation: 0.0,
          flexibleSpace: Image(
            image: AssetImage('assets/drawer_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        drawer: CategoryDrawer(
          items: CategoryCollector.getListExample(),
          onItemTap: (id) => print(id),
        ),

        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomeScreen(),
            MapScreen(),
            LedgerScreen(),
            PersonalScreen(),
          ],
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 10),
              _createIcon(Icons.home, 0),
              SizedBox(width: 10),
              _createIcon(Icons.map, 1),
              SizedBox(width: 10),
              _createIcon(Icons.local_florist, 2),
              SizedBox(width: 10),
              _createIcon(Icons.person, 3),
              SizedBox(width: 10),
            ],
          ),
          color: Theme.of(context).primaryColor,
        ),

      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  IconButton _createIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon,size: 24.0,),
      color: _getBottomIconColor(index),
      onPressed: () => _pageController.jumpToPage(index),
    );
  }

  Color _getBottomIconColor(int index) {
    return _page == index
        ? Theme.of(context).accentColor
        : Theme.of(context).textTheme.caption.color;
  }
}
