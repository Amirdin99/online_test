import 'dart:io';

import 'package:flutter/material.dart';

import '../../repositories/user_repositories.dart';
import '../../rouutes/route_names.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _resentPinCodeController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _fatherNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _gmailFocusNode = FocusNode();
  final FocusNode _pinCodeFocusNode = FocusNode();
  final FocusNode _resentPinCodeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.of(context)
      //               .pushReplacementNamed(MainRoutes.selectLanguage);
      //         },
      //         child: Icon(
      //             Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
      //       ),
      //       const SizedBox(width: 16),
      //       const Text("Ro'yxotdan o'tish"),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(MainRoutes.selectLanguage);
                    },
                    child: Icon(Platform.isAndroid
                        ? Icons.arrow_back
                        : Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    "Ro'yxotdan o'tish",
                    style: TextStyle(
                        color: Color(0xff2d2756),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 4),

                      /// Bu yerda isim
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            label: Text("Isim*")),
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

                      /// Bu yerda familiya
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            label: Text("Familiya*")),
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
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),

                      /// otasini ismi
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            label: Text("Otasining ismi*")),
                        enabled: true,
                        controller: _fatherNameController,
                        focusNode: _fatherNameFocusNode,
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

                      /// telifon raqan
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            label: Text("Telifon raqami*")),
                        enabled: true,
                        controller: _phoneNumberController,
                        focusNode: _phoneNumberFocusNode,
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

                      /// Electron pochta
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_box),
                            label: Text("Elektron pochta*")),
                        enabled: true,
                        controller: _gmailController,
                        focusNode: _gmailFocusNode,
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

                      /// Parol
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.ac_unit_rounded),
                            label: Text("Parol*")),
                        enabled: true,
                        controller: _pinCodeController,
                        focusNode: _pinCodeFocusNode,
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

                      /// Resent Pin code
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.ac_unit_rounded),
                            label: Text("Parolni takrorlang*")),
                        enabled: true,
                        controller: _resentPinCodeController,
                        focusNode: _resentPinCodeFocusNode,
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
                      const SizedBox(height: 80),
                      GestureDetector(
                          onTap: () async {
                            final response =
                                await UserRepositories.getInstance()
                                    .userRegisterApi(
                              password: _pinCodeController.text,
                              username: _gmailController.text,
                              first_name: _nameController.text,
                              last_name: _lastNameController.text,
                              middle_name: _fatherNameController.text,
                              phone: _phoneNumberController.text,
                              org_id: 1001223456,
                              org_name: "Test LLC",
                            );
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Ro'yxotdan o'tish".toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
