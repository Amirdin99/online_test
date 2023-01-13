import 'dart:io';

import 'package:flutter/material.dart';

import '../rouutes/route_names.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _nameController.text = "Inomjon Muxtorov";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(MainRoutes.home_screen);
              },
              child: Icon(
                  Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
            ),
            const SizedBox(width: 16),
            const Text("Mening Profilm"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                    radius: 70,
                  ),
                ),
                InkWell(
                    onTap: () {
                      /// here use Image Picker
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xff6F00EA),
                    ))
              ],
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Ism:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            "Familiya:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: const Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            "Ism:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            "Ism:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            "Ism:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            "Ism:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xff6F00EA)), //<-- SEE HERE
                          ),
                        ),
                        enabled: true,
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yaroqli ismni kriting";
                          }
                          return null;
                        },
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
