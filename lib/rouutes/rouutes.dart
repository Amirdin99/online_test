import 'package:flutter/material.dart';
import 'package:online_test/rouutes/route_names.dart';
import 'package:online_test/screens/aplication/aplication_page.dart';
import 'package:online_test/screens/home_screen/home_widgets/test_screen.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/my_profile_page.dart';
import '../screens/select_language/select_language.dart';
import '../screens/sign_in/sign_in_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../widget/pin_code_login.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = navigatorKey.currentState?.canPop() ?? false;
        if (canPop) {
          navigatorKey.currentState?.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: MainRoutes.splash,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder? builder;
          switch (settings.name) {
            case MainRoutes.splash:
              builder = (BuildContext _) => const SplashScreen();
              break;
            case MainRoutes.aplication:
              builder = (BuildContext _) => const AplicationPage();
              break;
            case MainRoutes.selectLanguage:
              builder = (BuildContext _) => const SelectLanguage();
              break;
            case MainRoutes.sign_up_screen:
              builder = (BuildContext _) => const SignUpPage();
              break;
            case MainRoutes.sign_in_screen:
              builder = (BuildContext _) => const SignInPage();
              break;
            case MainRoutes.home_screen:
              builder = (BuildContext _) => const HomeScreenPage();
              break;
            case MainRoutes.my_profile_screen:
              builder = (BuildContext _) => const MyProfilePage();
              break;
            case MainRoutes.test_screen:
              builder = (BuildContext _) => TestScreen();
              break;
              case MainRoutes.login_with_pin:
              builder = (BuildContext _) => PassCodeScreen();
              break;
          }
          if (builder != null) {
            return MaterialPageRoute(builder: builder, settings: settings);
          }
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
