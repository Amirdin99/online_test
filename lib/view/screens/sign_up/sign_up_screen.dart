import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_test/core/rouutes/route_names.dart';
import 'package:provider/provider.dart';

import '../../../core/api_service/api_response.dart';
import '../../../view_model/auth_view_mode.dart';
import '../../../widget/error.dart';
import '../../../widget/loading.dart';


class SignUpPage extends StatefulWidget {
   SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  final TextEditingController _resentPinCodeController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _gmailFocusNode = FocusNode();
  final FocusNode _pinCodeFocusNode = FocusNode();
  final FocusNode _resentPinCodeFocusNode = FocusNode();
   final AuthViewModel viewModel = AuthViewModel();

   @override
   void initState() {
     viewModel.fetchMediaData("");
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: ChangeNotifierProvider<AuthViewModel>.value(
        value: viewModel,
        child: Consumer<AuthViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.response.status) {
            case Status.LOADING:
              print("MARAJ :: LOADING");
              return LoadingWidget();
            case Status.ERROR:
              print("MARAJ :: ERROR");
              return MyErrorWidget(viewModel.response.message ?? "NA");
            case Status.COMPLETED:
              print("MARAJ :: COMPLETED");
              return _buildUi(context);
            default:
          }
          return Container();
        }),
      ),
    );
  }
  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildUi(BuildContext context){
     return SingleChildScrollView(
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
                         .pushReplacementNamed(MainRoutes.sign_in_screen);
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
                     TextFormField(
                       decoration: const InputDecoration(
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color:  Color(0xff2d2756),),
                           ),
                           prefixIcon: Icon(Icons.account_circle_outlined,color: Color(0xff2d2756),),
                           label: Text("Isim*"), labelStyle: TextStyle(color: Color(0xff2d2756))),
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
                         color: const Color(0xff2d2756),
                         fontWeight: FontWeight.w600,
                         fontSize: 14,
                       ),
                     ),
                     const SizedBox(height: 16),
                     /// telifon raqan
                     TextFormField(
                       keyboardType: TextInputType.phone,
                       decoration: const InputDecoration(
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color:  Color(0xff2d2756),),
                           ),
                           prefixIcon: Icon(Icons.phone,color: Color(0xff2d2756),),
                           label: Text("Telifon raqami*"), labelStyle: TextStyle(color: Color(0xff2d2756))),
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
                       keyboardType: TextInputType.emailAddress,
                       decoration: const InputDecoration(
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color:  Color(0xff2d2756),),
                           ),
                           prefixIcon: Icon(Icons.mail,color: Color(0xff2d2756),),
                           label: Text("Elektron pochta*"), labelStyle: TextStyle(color: Color(0xff2d2756))),
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
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color:  Color(0xff2d2756),),
                           ),
                           prefixIcon: Icon(CupertinoIcons.padlock_solid,color: Color(0xff2d2756),),
                           label: Text("Parol*"), labelStyle: TextStyle(color: Color(0xff2d2756))),
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
                           focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color:  Color(0xff2d2756),),
                           ),
                           prefixIcon: Icon(CupertinoIcons.padlock_solid,color: Color(0xff2d2756),),
                           label: Text("Parolni takrorlang*"), labelStyle: TextStyle(color: Color(0xff2d2756))),
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
                     const SizedBox(height: 20),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         const SizedBox(),
                         InkWell(
                           onTap: (){
                             Navigator.of(context)
                                 .pushReplacementNamed(MainRoutes.sign_in_screen);
                           },
                           child: const Text("Hisobingiz bormi ?",style: TextStyle(color: Color(0xff2a2756)),),
                         )
                       ],
                     ),
                     const SizedBox(height: 80),
                     GestureDetector(
                         onTap: () async {
                         },
                         child: Container(
                           height: 50,
                           width: double.infinity,
                           decoration: BoxDecoration(
                               color:const Color(0xff2d2756),
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
     );
  }
}