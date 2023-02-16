import 'package:flutter/material.dart';
import 'package:online_test/rouutes/route_names.dart';

import '../../widget/drower_widget.dart';
import 'home_widgets/item_list.dart';

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
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text("Online test",style: TextStyle(
            color: Colors.white
        ),),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pushNamed(MainRoutes.test_screen);
          }, child: const Text("O'quv markazlari",style: TextStyle(
            color: Colors.white,
          ),)),
          const  SizedBox(
            width: 5,
          ),
        ],
      ),

      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
          return ItemList();
        }

        ),
      ),
    );
  }
}
