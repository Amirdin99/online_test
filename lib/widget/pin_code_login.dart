import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:local_auth/local_auth.dart';

import '../constants/utils.dart';
import '../rouutes/route_names.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key? key}) : super(key: key);

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {





  bool isFingerprint = false;
  late int pinCode;
  Future<Null> biometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool authenticated = false;

    try {
      // authenticated = await auth.authenticateWithBiometrics(
      //     localizedReason: 'Scan your fingerprint to authenticate',
      //     useErrorDialogs: true,
      //     stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future getPinCode() async {
    pinCode = await Utils.getPinCode() ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LockScreen(
        title: "Pincodni kiriting",
        passLength: 4,
        bgImage: "assets/splash_image.png",
        fingerPrintImage: Image.asset("assets/img.png"),
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (passcode) async {
            if (pinCode != passcode) {
              return false;
            }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushNamed(MainRoutes.home_screen);
        });
  }
}