import 'package:flutter/material.dart';

import '../../constants/utils.dart';
import '../../rouutes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animatedController;
  late CurvedAnimation _curvedAnimation;
  bool visibleButton = false;
  var isRegistered = false;
  var isPinEnabled = false;
  var isFirstEntered = false;

  @override
  void initState() {
    super.initState();
    init();
    getUserAuth();
  }
  bool isUserRegistered = false;
  void getUserAuth() async {
    isUserRegistered = await Utils.getUserAuth() ?? false;
        setState(() {});
  }

  init() {
    _animatedController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..forward()
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed)   {
              isUserRegistered
                ? Navigator.of(context).pushReplacementNamed(MainRoutes.login_with_pin)
                : Navigator.of(context).pushReplacementNamed(MainRoutes.sign_up_screen);
            }
          });
    _curvedAnimation =
        CurvedAnimation(parent: _animatedController, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    super.dispose();
    _animatedController.dispose();
  }

  void restartAnimation() {
    if (!_animatedController.isAnimating) {
      _animatedController.reset();
      _animatedController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              child: ScaleTransition(
                scale: Tween(begin: 0.8, end: 1.0).animate(_curvedAnimation),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child:
                      Image.asset('assets/OnlineTest.png', fit: BoxFit.fill),
                ),
              ),
            ),
             const Text("Online Test",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            visibleButton
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 18),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Coose Lenguage"),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
