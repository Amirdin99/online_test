import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../repositories/user_repositories.dart';
import '../../rouutes/route_names.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _gmailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Log In",
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.mail),
                            label: Text("Gmail*")),
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
                              color: Color(0xff2d2756),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                      ),
                      const SizedBox(height: 16),

                      /// Bu yerda familiya
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _isVisible ? false : true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () => updateStatus(),
                              icon: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            prefixIcon: Icon(CupertinoIcons.padlock_solid),
                            label: Text("Parol*")),
                        enabled: true,
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
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

                      const SizedBox(height: 80),
                      GestureDetector(
                          onTap: () async {
                            final response =
                                await UserRepositories.getInstance().userSignIn(
                                    password: _passwordController.text,
                                    username: _gmailController.text);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Krish".toUpperCase(),
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
