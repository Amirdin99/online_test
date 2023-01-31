import 'package:flutter/material.dart';
import 'package:online_test/repositories/user_repositories.dart';

import '../../widget/drower_widget.dart';

class AplicationPage extends StatefulWidget {
  const AplicationPage({Key? key}) : super(key: key);

  @override
  State<AplicationPage> createState() => _AplicationPageState();
}

class _AplicationPageState extends State<AplicationPage> {
  @override
  void initState() {
    UserRepositories.getInstance()
        .postAplication(111111111, "Meni darsga olishizni hohliman!", 1);
    super.initState();
  }

  TextEditingController orgController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController anoteController = TextEditingController();
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DroverWidget(),
      ),
      appBar: AppBar(
        title: const Text("Aplication"),
      ),
      body: Container(
        // color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: orgController,
                key: key,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Colors.greenAccent),
              ),
            ),
          ),

              TextFormField(
                controller: subjectController,
              ),
              TextFormField(
                controller: anoteController,
              ),
              ElevatedButton(onPressed: (){
                UserRepositories.getInstance().login(password: "amirdin@gmail.com", username: "amirdin1999");
              }, child: Text("Tekshirish")),
            ],
          ),
        ),
      ),
    );
  }
}
