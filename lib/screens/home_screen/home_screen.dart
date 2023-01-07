import 'package:flutter/material.dart';

import '../../widget/drower_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DroverWidget(),
      ),
      appBar: AppBar(
        title: const Text("Online test"),
      ),
      body: Column(
        children: [Text("Home Page")],
      ),
    );
  }
}
