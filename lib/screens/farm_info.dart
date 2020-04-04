import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:happjfarm/models/farm.dart';
import 'package:happjfarm/models/user.dart';
import 'package:happjfarm/utils/constant.dart';

class FarmInfoScreen extends StatefulWidget {
  FarmInfoScreen({this.farm});

  final Farm farm;

  @override
  _FarmInfoScreenState createState() => _FarmInfoScreenState();
}

class _FarmInfoScreenState extends State<FarmInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(Constants.title_FarmInfo),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            CarouselSlider(
              height: MediaQuery.of(context).size.height/3.2,
              items: widget.farm.image.map((img) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                        fadeInCurve: Curves.bounceIn,
                        placeholder: Constants.imgLoading,
                        image: img,
                        fit: BoxFit.cover,
                        ),
                    ),
                  );
                },
              ).toList(),
              autoPlay: true,
              viewportFraction: 1.0,
            ),

            SizedBox(height: 16.0),
            Text(
              widget.farm.product,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10.0),
            Text(
              widget.farm.priceVND + " VND/kg",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
            ),

            SizedBox(height: 10.0),
            Text(
              Constants.standard + widget.farm.standard,
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
            ),
            SizedBox(height: 10.0),
            Text(
              Constants.output + widget.farm.output,
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
            ),

            SizedBox(height: 20.0),
            Text(
              Constants.description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),

            SizedBox(height: 10.0),
            Text(
              widget.farm.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),

      bottomNavigationBar:
      User.getLoggedUser() != null
          ? Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                User.getLoggedUser().isActivated
                    ? Constants.opt_ContactOwner //import 'package:url_launcher/url_launcher.dart' as UrlLauncher;   UrlLauncher.launch('tel:+${p.phone.toString()}')
                    : Constants.opt_ActiveContact,
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () => contactOwner(),
            ),
          )
          : Container(
            height: 50.0,
            child: RaisedButton(
              child: Text(
                Constants.opt_LoginContact,
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () => contactOwner(),
            ),
          ),
    );
  }

  void contactOwner() {
    String ownerId = widget.farm.ownerId;
    print(ownerId);
  }

}
