import 'package:flutter/material.dart';

class OrganizationItems extends StatelessWidget {
  String? organizationName;
  int? organizationID;

  OrganizationItems({Key? key, this.organizationName, this.organizationID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //     color: Colors.blue
      //   )
      // ),
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        shadowColor: Colors.blue,
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.shutterstock.com/image-vector/registration-required-men-fill-form-260nw-1802612908.jpg"),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text("${organizationName}"),
                  ),
                  Container(
                    child: Text("${organizationID}"),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
