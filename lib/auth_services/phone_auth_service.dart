import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthService {
  PhoneAuthService(this.context);

  String phoneNo, smsId, verificationId;

  BuildContext context;

  Future<void> verifyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]){
      this.verificationId = verId;
      smsCodeDialog(context).then((value){
        print('Signed In');
      });
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth){
      print('Verified');
    };
    final PhoneVerificationFailed verifyFailed = (AuthException e) {
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nhập mã OTP'),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value)  {
                this.smsId = value;
              },
            ),
          ),
          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  FirebaseAuth.instance.currentUser().then((user){
                    if(user != null){
                      //ok
                    }
                    else{
                      Navigator.of(context).pop();
                      signIn(smsId);
                    }
                  });
                },
                child: Text('Done', style: TextStyle( color: Colors.blue),))
          ],
        );
      },
    );
  }

  Future<void> signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    AuthResult result = await FirebaseAuth.instance.signInWithCredential(credential);
    if (null == result) {
      // Log fail
      print("Login failed");
      return;
    }
    print(result.user.uid);
    print("Login ok");

  }


}