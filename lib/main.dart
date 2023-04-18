import 'package:flutter/material.dart';

import 'core/rouutes/rouutes.dart';
import 'models/NavigationService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static NavigationService navigationService = NavigationService();

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(navigationService);
}

class _MyAppState extends State<MyApp> {
  final NavigationService navigationService;

  _MyAppState(this.navigationService);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      home: const MainNavigator(),
    );
  }
}
