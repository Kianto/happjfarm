import 'package:flutter/material.dart';
import 'package:happjfarm/models/user.dart';
import 'package:happjfarm/screens/auth/authentic_callback.dart';
import 'package:happjfarm/utils/constant.dart';

class ProfileScreen extends StatefulWidget {
  final AuthenticCallback callback;

  ProfileScreen(this.callback);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User loggedUser = User.getLoggedUser();

  @override
  Widget build(BuildContext context) {
    String role = loggedUser.isActivated
        ? "Please select your role below:"
        : loggedUser.isFarmer
          ? "Farmer"
          : "Merchant";

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),

        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 1.0, 0.0),
                  child: Icon(
                    Icons.contacts,
                    size: 100.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            loggedUser.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            loggedUser.contact,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => _logout(),
                            child: Text(Constants.logout,
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).accentColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  flex: 3,
                ),
              ],
            ),

            Divider(),
            SizedBox(height: 16.0),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                Constants.title_AccountInfo.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            ListTile(
              title: Text(
                Constants.name,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),

              subtitle: Text(loggedUser.name),
              trailing: IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20.0,
                ),
                onPressed: () {},
                tooltip: Constants.edit,
              ),
            ),
            _buildInfo(Constants.idNumber, loggedUser.idNumber),
            _buildInfo(Constants.phoneNumber, loggedUser.phone),
            _buildInfo(Constants.address, loggedUser.address),

            SizedBox(height: 16.0),
            _buildInfo("Active role", role),
            _buildAccountType(loggedUser.isActivated),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  ListTile _buildInfo(String title, String content) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),

      subtitle: Text(content),
    );
  }

  Widget _buildAccountType(bool isActivated) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/merchant.png", fit: BoxFit.cover, height: 80,),
                  Text("As a Merchant")
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/farmer.png", fit: BoxFit.cover, height: 80,),
                  Text("As a Farmer")
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _logout() {
    widget.callback.logout();
  }

}
