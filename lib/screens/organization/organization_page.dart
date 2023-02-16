import 'package:flutter/material.dart';
import 'package:online_test/models/organization_model%20/organization.dart';
import 'package:online_test/repositories/user_repositories.dart';
import 'package:online_test/rouutes/route_names.dart';
import 'package:online_test/screens/organization/widgets/item_widget.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
 

  Future<Organization> getOrganization()async{
   final  organization=await UserRepositories.getInstance().getOrganiztion();
   return organization;
  }
  @override
  void initState() {
    getOrganization();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O'quv markazlari"),
      ),
      body: FutureBuilder<Organization>(
        future: getOrganization(),
        builder: (
            BuildContext context,
            AsyncSnapshot<Organization> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return Container(
                color: Colors.transparent,
                child: ListView.builder(
                    itemCount: snapshot.data?.results?.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                           Navigator.of(context).pushNamed(MainRoutes.subject_page);
                          },
                          child: OrganizationItems(organizationName: "${snapshot.data?.results?[index].name}",organizationID: snapshot.data?.results?[index].id,));
                    }),
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

