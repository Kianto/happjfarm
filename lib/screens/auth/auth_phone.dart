import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:happjfarm/auth_services/phone_auth_service.dart';
import 'package:happjfarm/utils/constant.dart';

import 'authentic_callback.dart';

class PhoneScreen extends StatefulWidget {
  PhoneScreen(this.callback);

  final AuthenticCallback callback;

  @override
  State<StatefulWidget> createState() {
    return _PhoneScreenState();
  }
}

class _PhoneScreenState extends State<PhoneScreen> {
  String prePhoneCode = "+84";
  final TextEditingController _phoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          _buildSubtitle(Constants.title_AuthPhone),

          SizedBox(height: 30.0),
          _buildForm(_phoneControl, Constants.phoneNumber),

          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _buildActionButton(),
          ),

          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Divider(color: Theme.of(context).accentColor),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Container _buildSubtitle(String subtitle) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 25.0,
      ),
      child: Text(subtitle,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).accentColor,
          )),
    );
  }

  Container _buildActionButton() {
    return Container(
      height: 50.0,
      child: RaisedButton(
        child: Text(
          Constants.login.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => onActionButtonClick(),
        color: Theme.of(context).accentColor,
      ),
    );
  }

  Card _buildForm(TextEditingController controller, String hintText) {
    return Card(
      elevation: 3.0,
      child: Container(
        padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Row(
          children: [
            CountryPickerDropdown(
              initialValue: 'VN',
              itemBuilder: _buildDropdownItem,
              priorityList:[
                CountryPickerUtils.getCountryByIsoCode('VN'),
                CountryPickerUtils.getCountryByIsoCode('KH'),
              ],
              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
              onValuePicked: (Country country) {
                print("${country.phoneCode}");
                prePhoneCode = "+" + country.phoneCode;
              },
            ),

            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: _getFormDecoration(hintText),
                maxLines: 1,
                controller: controller,
                keyboardType: TextInputType.phone,
              ),
            ),
          ]
        ),
      ),
    );
  }

  InputDecoration _getFormDecoration(String hintText) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ));
  }

  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );

  void onActionButtonClick() {
    PhoneAuthService service = PhoneAuthService(context);
    service.phoneNo = prePhoneCode + _phoneControl.text;
    print(service.phoneNo);

    service.phoneNo = "+84563840148";
//    service.verifyPhone();

    // TODO: validate
    // TODO: log
    widget.callback.logged();
  }

}
