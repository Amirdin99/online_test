import 'package:flutter/material.dart';

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
  }

  init() {
    _animatedController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (isPinEnabled) {
                Navigator.of(context)
                    .pushReplacementNamed(MainRoutes.selectLanguage);
              } else {
                Navigator.of(context).pushReplacementNamed(isFirstEntered
                    ? (isRegistered
                        ? MainRoutes.sign_in_screen
                        : MainRoutes.sign_up_screen)
                    : MainRoutes.selectLanguage);
              }
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
                scale: Tween(begin: 0.5, end: 1.0).animate(_curvedAnimation),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Image.network("https://xmed.uz/xmedlogo1024x500.png"),
                ),
              ),
            ),
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
