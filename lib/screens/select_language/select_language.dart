import 'package:flutter/material.dart';

import '../../rouutes/route_names.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(MainRoutes.home_screen);
            },
            child: Text("Select Language")),
      ),
    );
  }
}
