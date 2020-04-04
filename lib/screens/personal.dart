import 'package:flutter/material.dart';
import 'package:happjfarm/models/user.dart';
import 'package:happjfarm/screens/auth/auth_form.dart';
import 'package:happjfarm/screens/auth/auth_phone.dart';
import 'package:happjfarm/screens/auth/auth_profile.dart';
import 'package:happjfarm/screens/auth/authentic_callback.dart';

class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> with AuthenticCallback {

  bool _isLogged;

  void changeLog() {
    setState(() {
      _isLogged = !_isLogged;
    });
  }

  @override
  Widget build(BuildContext context) {
    _isLogged = null != User.getLoggedUser();

    return Scaffold(
      body: _isLogged ? ProfileScreen(this) : PhoneScreen(this)/*FormScreen(this)*/,
    );
  }

  @override
  void logged() {
    User.logUser();
    changeLog();
  }

  @override
  void logout() {
    User.outUser();
    changeLog();
  }
  
}
