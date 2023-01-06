import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Online test",style: TextStyle(
          color: Colors.blue
        ),),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Testlar",style: TextStyle(
            color: Colors.blue,
          ),)),
         const  SizedBox(
            width: 5,
          ),
          TextButton(onPressed: (){}, child: const Text("Sertifikatlar",style: TextStyle(
            color: Colors.blue,
          ),)),

        ],
      ),
      body: Container(
        color: Colors.white,
        child: Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context,index){
            return ItemList();
          }

          ),
        ),
      ),
    );
  }
}
