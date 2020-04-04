import 'package:flutter/material.dart';
import 'package:happjfarm/models/pin_pill_info.dart';
import 'package:happjfarm/utils/constant.dart';

class MapPinPillComponent extends StatefulWidget {
  MapPinPillComponent({ this.isShow, this.currentlySelectedPin });

  final bool isShow;
  final PinInformation currentlySelectedPin;

  @override
  State<StatefulWidget> createState() => MapPinPillComponentState();
}

class MapPinPillComponentState extends State<MapPinPillComponent> {
  @override
  Widget build(BuildContext context) {

    return AnimatedPositioned(
        bottom: widget.isShow ? 36 : -100,
        right: 0,
        left: 0,
        duration: Duration(milliseconds: 200),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              margin: EdgeInsets.only(left: 5),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: <BoxShadow>[
                  BoxShadow(blurRadius: 20, offset: Offset.zero, color: Colors.grey.withOpacity(0.5))
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 50, height: 50,
                    margin: EdgeInsets.only(left: 10),
                    child: ClipRRect(child: Image.network(widget.currentlySelectedPin.avatarPath, fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.currentlySelectedPin.product, style: TextStyle(color: Theme.of(context).accentColor)),
                          Text(Constants.pillPrice + widget.currentlySelectedPin.price, style: TextStyle(fontSize: 12, color: Colors.grey)),
                          Text(Constants.pillStandard + widget.currentlySelectedPin.standard, style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }

}