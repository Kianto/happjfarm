import 'package:flutter/material.dart';

class Constants{
  static const String appName = "HAPPJ FARM MAP";
  static const String appIcon = "assets/favicon.png";
  static const String imgLoading = "assets/loading.gif";

  static String all = "ALL";
  static String none = "none";
  static const String cVietGap = "VietGAP";
  static const String cGlobalGAP = "GlobalGAP";
  static const String cOrganic = "Organic";
  static const String cJAS = "JAS";
  static const String cUTZ = "UTZ";

  static const String logoVietGap = "assets/standards/c_vietgap.png";
  static const String logoGlobalGAP = "assets/standards/c_globalgap.png";
  static const String logoOrganic = "assets/standards/c_organic.png";
  static const String logoJAS = "assets/standards/c_jas.png";
  static const String logoUTZ = "assets/standards/c_utz.png";

  static String login =  "Login";
  static String phoneNumber = "Phone Number";
  static String logout = "Logout";
  static String title_AccountInfo = "Profile";
  static String name = "Name";
  static String idNumber ="Personal ID Number";
  static String address = "Address";
  static String category = "Category";
  static String pillPrice =  "Price: ";
  static String pillStandard ="Standard: ";

  static String edit = "Edit";
  static String filter =  "Filter";

  static String title_Farm = "Farms";
  static String title_AuthPhone = "Login by phone number";
  static String title_FarmInfo ="Farm Infomation";
  static String standard = "Stadard: ";
  static String output = "Output: ";
  static String description = "Description: ";
  static String empty =  "This is empty";

  static String opt_ContactOwner = "Contact owner";
  static String opt_ActiveContact = "Activate your account";
  static String opt_LoginContact = "Login to contact owner";

  static String opt_LoginRequire ="You need to login to use this page";
  static String opt_YourFarms = "Your Farms";
  static String opt_MarkedFarms = "Marked Farms";

  static String youHere = "Your location";


  // Colors for theme
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.green;
  static Color darkAccent = Colors.green[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
          color: darkBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: darkPrimary,
      ),
    ),
  );


}