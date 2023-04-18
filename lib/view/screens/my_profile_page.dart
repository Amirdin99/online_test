
import 'package:flutter/material.dart';
import 'package:online_test/models/user_model/user_model.dart';
import 'package:online_test/widget/drower_widget.dart';


class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final GlobalKey _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emileController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _secondPhoneNumberController =
      TextEditingController();
  final TextEditingController _regionNameController = TextEditingController();
  final TextEditingController _districNameController = TextEditingController();
  final TextEditingController _addresNameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emileFocusNode = FocusNode();
  final FocusNode _fatherNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _secondPhoneNumberFocusNode = FocusNode();
  final FocusNode _regionNameFocusNode = FocusNode();
  final FocusNode _adresNameFocusNode = FocusNode();
  final FocusNode _districNameFocusNode = FocusNode();
  bool isCircularProgress = false;
  int _value = 0;
  dynamic regoinsDetiles;

  void initState() {

    getUserRegion();
    super.initState();
  }


  Future<dynamic> getUserRegion()async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DroverWidget(),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff2d2756),
          title: const Text("Mening Profilim")),
      body: FutureBuilder<UserModel>(
        future: null,
        builder: (
          BuildContext context,
          AsyncSnapshot<UserModel> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
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
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _lastNameController,
                                focusNode: _lastNameFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli familiya kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: const Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Otasining ismi:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _fatherNameController,
                                focusNode: _fatherNameFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli ismni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Emile:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _emileController,
                                focusNode: _emileFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli emileni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Tefifon raqami:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _phoneNumberController,
                                focusNode: _phoneNumberFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli telifon raqmni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Qo'shimcha telifon raqami:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _secondPhoneNumberController,
                                focusNode: _secondPhoneNumberFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli telifon raqmni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Viloyati:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color(0xff6F00EA),
                                        width: 2)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      DropdownButton(
                                          iconSize: 40,
                                          elevation: 20,
                                          underline: const SizedBox(),
                                          value: _value,
                                          items: List.generate(
                                              regoinsDetiles['count'] ?? 1,
                                              (index) => DropdownMenuItem(
                                                    child: Text(regoinsDetiles['results'][index]['name'] ?? '--'),
                                                    value: index,
                                                  )),
                                          onChanged: (value) {
                                            setState(() {
                                              _value = value!;
                                              print(_value);
                                              print(regoinsDetiles['results'][_value]['id']);
                                            });
                                          }),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Tumani:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _districNameController,
                                focusNode: _districNameFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli nomni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: const [
                                  Text(
                                    "Kochasi:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color:
                                            Color(0xff6F00EA)), //<-- SEE HERE
                                  ),
                                ),
                                enabled: true,
                                controller: _addresNameController,
                                focusNode: _adresNameFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Yaroqli nomni kriting";
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color: const Color(0xff2d2756),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: GestureDetector(
                                    onTap: () async {
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff2d2756),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: !isCircularProgress
                                            ? Text(
                                                "Krish".toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )
                                            : const CircularProgressIndicator(),
                                      ),
                                    )),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              );
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}
