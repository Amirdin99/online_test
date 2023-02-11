import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/ststus_code.dart';
import '../constants/url_constants.dart';
import '../constants/utils.dart';
import '../models/aplication_models/get_aplication.dart';
import '../models/aplication_models/get_aplication_list.dart';

class UserRepositories {
  static final UserRepositories _singleton = UserRepositories._internal();

  UserRepositories._internal();


  static UserRepositories getInstance() {
    return _singleton;
  }

  Future<dynamic> userRegisterApi({
    required String password,
    required String username,
    required String first_name,
    required String last_name,
    required String middle_name,
    required String phone,
  }) async {
    dynamic resultClass;
    final requestParameters = {
      "password": password,
      "username": username,
      "first_name": first_name,
      "last_name": last_name,
      "middle_name": middle_name,
      "phone": phone,
    };

    final String baseUrl = BASE_URL.SIGN_UP_API;
    final requestUrl = Uri.parse(baseUrl);
    final response = await http.post(requestUrl,
        headers: {
          "Content-Type": 'application/json',
        },
        body: json.encode(requestParameters));

    final int statusCode = response.statusCode;
    var resultClass2 = json.decode(utf8.decode(response.bodyBytes));
    print("Flutter registretion $resultClass2 $statusCode ${response.body}");

    if(statusCode == 201 || statusCode == 201) {
        var resultClass = USER_REGISTERED;
        return resultClass;
      } else {
      return resultClass2;
    }
  }

  Future<dynamic> login(
      {required String password, required String username}) async {
    dynamic resultClass;
    final requestParameters = {
      "password": password,
      "username": username,
    };

    final String baseUrl = BASE_URL.SIGN_IN_API;
    final requestUrl = Uri.parse(baseUrl);
    final response = await http.post(requestUrl,
        headers: {
          "Content-Type": 'application/json',
        },
        body: json.encode(requestParameters));

    final int statusCode = response.statusCode;
    if(statusCode == 200){
       var resultClass = json.decode(utf8.decode(response.bodyBytes));
       print("$resultClass");
      return resultClass;
    }
    else if(statusCode == 400) {
      var resultClass = "error login or parol";
      print("$resultClass");
      return resultClass;
  }
    else if(statusCode == 401){
      print("${resultClass}amirdin");

    }
    return resultClass;
    }

    Future<dynamic> postAplication(double org, String anote, int subject)async{
    dynamic resultClass;
    final requestParameters = {
      "org": org,
      "subject": subject,
      "anote": anote,
    };
    final requestUrl=Uri.parse(BASE_URL.POST_APLICATION);
    final response=await http.post(requestUrl,
      body: json.encode(requestParameters),
      headers: {
        "Content-Type": 'application/json',
      "Authorization":'Token ${Utils.token_generate}'
      }
    );
     resultClass = json.decode(utf8.decode(response.bodyBytes));
    final int statusCode = response.statusCode;
    if(statusCode==201){
      print(resultClass["status"]);
      return resultClass;
    }
    return requestUrl;
    }

  Future<GetAplicationList> getAplicationList()async{
    GetAplicationList aplicationList;
    // final requestParameters = {
    //   "org": org,
    //   "subject": subject,
    //   "anote": anote,
    // };
    final requestUrl=Uri.parse(BASE_URL.GET_APLICATION_LIST);
    final response=await http.get(requestUrl,
        // body: json.encode(requestParameters),
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    final resultClass = json.decode(utf8.decode(response.bodyBytes));
    aplicationList=GetAplicationList.fromJson(resultClass);
    final int statusCode = response.statusCode;
    if(statusCode==200){
      print(resultClass);
      return aplicationList;
    }
    return aplicationList;
  }


  Future<dynamic> putAplication(String anote, String status, String accepted_anote,String rejected_anote,String canceled_anote)async{
    dynamic resultClass;
    final requestParameters = {
      "anote": anote,
      "status": status,
      "accepted_anote": accepted_anote,
      "rejected_anote": rejected_anote,
      "canceled_anote": canceled_anote,
    };
    final requestUrl=Uri.parse(BASE_URL.PUT_APLICATION);
    final response=await http.put(requestUrl,
        body: json.encode(requestParameters),
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    resultClass = json.decode(utf8.decode(response.bodyBytes));
    final int statusCode = response.statusCode;
    if(statusCode==200){
      print(resultClass["status"]);
      return resultClass;
    }
    return requestUrl;
  }
  Future<GetAplication> getAplication()async{
    GetAplication aplicationList;
    // final requestParameters = {
    //   "org": org,
    //   "subject": subject,
    //   "anote": anote,
    // };
    final requestUrl=Uri.parse(BASE_URL.GET_APLICATION+"${Utils.aplicationId}");
    final response=await http.get(requestUrl,
        // body: json.encode(requestParameters),
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    final resultClass = json.decode(utf8.decode(response.bodyBytes));
    aplicationList=GetAplication.fromJson(resultClass);
    final int statusCode = response.statusCode;
    if(statusCode==200){
      print(resultClass);
      return aplicationList;
    }
    return aplicationList;
  }
  Future<GetAplication> getStudents()async{
    GetAplication aplicationList;
    // final requestParameters = {
    //   "org": org,
    //   "subject": subject,
    //   "anote": anote,
    // };
    final requestUrl=Uri.parse(BASE_URL.GET_STUDENTS);
    final response=await http.get(requestUrl,
        // body: json.encode(requestParameters),
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    final resultClass = json.decode(utf8.decode(response.bodyBytes));
    aplicationList=GetAplication.fromJson(resultClass);
    final int statusCode = response.statusCode;
    if(statusCode==200){
      print(resultClass);
      return aplicationList;
    }
    return aplicationList;
  }

}
