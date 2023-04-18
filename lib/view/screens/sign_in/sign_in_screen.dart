import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_test/core/rouutes/route_names.dart';


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
  bool isCircularProgress = false;

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
                          .pushReplacementNamed(MainRoutes.sign_up_screen);
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
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:  Color(0xff2d2756),),
                            ),
                            prefixIcon: Icon(CupertinoIcons.mail,color: Color(0xff2d2756),),
                            label: Text("Gmail*"),
                            labelStyle: TextStyle(color: Color(0xff2d2756))
                        ),

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
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _isVisible ? false : true,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color:  Color(0xff2d2756),),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => updateStatus(),
                              icon: Icon(_isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,color: const  Color(0xff2d2756),),
                            ),
                            prefixIcon:const Icon(CupertinoIcons.padlock_solid,color: Color(0xff2d2756),),
                            label: const Text("Parol*"), labelStyle:
                        const TextStyle(color: Color(0xff2d2756))),
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
                          color: const Color(0xff2d2756),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 30),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context)
                          .pushReplacementNamed(MainRoutes.sign_up_screen);
                    },
                    child: Text("Ro'yxatdan o'tish",style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: const Color(0xff2d2756),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.3),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                  onTap: () async {
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xff2d2756),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: !isCircularProgress
                          ? Text(
                        "Krish".toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      )
                          : const CircularProgressIndicator(),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}