import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:online_test/repositories/user_repositories.dart';

import '../../widget/drower_widget.dart';

class AplicationPage extends StatefulWidget {
  const AplicationPage({Key? key}) : super(key: key);

  @override
  State<AplicationPage> createState() => _AplicationPageState();
}

class _AplicationPageState extends State<AplicationPage> {

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  Future<void> disposeScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }
  @override
  void initState() {
    secureScreen();
    // UserRepositories.getInstance().postAplication(
    //   111111111,
    //   "Meni darsga olishizni hohliman!",
    //   1,
    // );
    super.initState();
  }
  @override
  void dispose() {
    disposeScreen();
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController orgController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController anoteController = TextEditingController();
  FocusNode orgFocusNode=FocusNode();
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
          child: Form(
            key: key,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    focusNode: orgFocusNode,
                    autofocus: true,
                    controller: orgController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Org",
                      //   enabledBorder: const OutlineInputBorder(
                      //
                      //     borderSide: BorderSide(
                      //
                      //         width: 3, color: Colors.blue),
                      //   ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    autofocus: true,
                    controller: subjectController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Subject",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    autofocus: true,
                    controller: anoteController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: "Anote",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(width: 3, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      UserRepositories.getInstance().postAplication(
                        double.parse(orgController.text),
                       anoteController.text,
                        int.parse(subjectController.text),
                      );
                      orgController.text="";
                      subjectController.text="";
                      anoteController.text="";
                      orgFocusNode.nextFocus();
                    },
                    child: Text("Jo'natish")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
