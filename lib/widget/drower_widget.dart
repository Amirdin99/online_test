import 'package:flutter/material.dart';

import '../rouutes/route_names.dart';

class DroverWidget extends StatefulWidget {
  const DroverWidget({Key? key}) : super(key: key);

  @override
  State<DroverWidget> createState() => _DroverVidgetState();
}

class _DroverVidgetState extends State<DroverWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32374d),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF02314b),
            height: 210,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(top: 24, left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.png'),
                    radius: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Muxtorov Inomjon",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    "muxtorovinomjon0227@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  // Divider(
                  //   color: Colors.redAccent, //color of divider
                  //   // height: 5, //height spacing of divider
                  // )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(MainRoutes.my_profile_screen);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 10),
              child: Row(
                children: const [
                  Icon(
                    Icons.account_circle_outlined,
                    color: Color(0xff25D3C2),
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Profil",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white60),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Image.asset(
                  "assets/certificat.png",
                  width: 30,
                  height: 30,
                  color: Color(0xff25D3C2),
                ),
                Text(
                  "Sertifikatlar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.text_snippet,
                  color: Color(0xff25D3C2),
                  size: 25,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Testlar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 8),
            child: Row(
              children: const [
                Icon(
                  Icons.local_post_office_outlined,
                  color: Color(0xff25D3C2),
                  size: 25,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Biz haqimizda",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 8),
            child: Row(
              children: const [
                Icon(
                  Icons.telegram,
                  color: Color(0xff25D3C2),
                  size: 25,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Telegram",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Image.asset(
                  "assets/instagram.png",
                  width: 30,
                  height: 30,
                  color: Color(0xff25D3C2),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Sertifikatlar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Image.asset(
                  "assets/fasebook.png",
                  width: 30,
                  height: 30,
                  color: Color(0xff25D3C2),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Sertifikatlar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(
                Icons.place,
                color: Color(0xff25D3C2),
              ),
              Expanded(
                child: Text(
                  " Toshket shaxar, \n Amir Temur ko'chasi 119 uy",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, top: 20),
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(width: 10),
                      Icon(
                        Icons.phone,
                        color: Color(0xff25D3C2),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "+998998780787",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
