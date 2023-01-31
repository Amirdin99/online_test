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
          TextButton(onPressed: (){}, child: const Text("Testlar",style: TextStyle(
            color: Colors.white,
          ),)),
          const  SizedBox(
            width: 5,
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pushNamed(MainRoutes.aplication);
          }, child: const Text("Sertifikatlar",style: TextStyle(
            color: Colors.white,
          ),)),

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
