import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_test/models/user_model/user_model.dart';

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
    if(statusCode == 201 || statusCode == 201) {
      final result = json.decode(utf8.decode(response.bodyBytes));
      Utils.token_generate  = result['token'];
      var resultClass = USER_REGISTERED;
      return resultClass;
    } else if(statusCode == 400) {
      var resultClass = USER_ALREADY_REGISTERED;
      return resultClass;
    } else if(statusCode == 401){
      var resultClass = USER_PHONE_NUMBER_OR_PASSWORD_ERROR;
      return resultClass;
    } else {
      var resultClass = SOMTHING_WRONG;
      return resultClass;
    }
  }

  Future<dynamic> login(
      {required String password, required String username}) async {
    dynamic resultClass;
    final requestParameters = {
      "password": password,
      "username": username,
    };

    final String baseUrl = BASE_URL.LOGIN;
    final requestUrl = Uri.parse(baseUrl);
    final response = await http.post(requestUrl,
        headers: {
          "Content-Type": 'application/json',
        },
        body: json.encode(requestParameters));

    final int statusCode = response.statusCode;
    if(statusCode == 200 || statusCode == 201 ){
      final result = json.decode(utf8.decode(response.bodyBytes));
      Utils.token_generate  = result['token'];
      resultClass = USER_LOGGED_IN;
      return resultClass;
    }
    else if(statusCode == 400) {
      resultClass = USER_PHONE_NUMBER_OR_PASSWORD_ERROR;
      return resultClass;
    }
    else if(statusCode == 401){
      resultClass = USER_NOT_REGISTERED;
    } else {
      resultClass = SOMTHING_WRONG;
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
  Future<dynamic> getUserRegion() async {
    final requestUrl=Uri.parse(BASE_URL.GET_USER_REGION+"?region=2");
    final response=await http.get(requestUrl,

        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    final resultClass = json.decode(utf8.decode(response.bodyBytes));

    final int statusCode = response.statusCode;
    if(statusCode==200 || statusCode==201 ){
      return resultClass;
    }
    return resultClass;
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

  Future<dynamic> getUserProfile()async{
    UserModel userProfile;
    final requestUrl=Uri.parse(BASE_URL.GET_USER_PROFILE);
    final response=await http.get(requestUrl,
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        }
    );
    final resultClass = json.decode(utf8.decode(response.bodyBytes));
    userProfile= UserModel.fromJson(resultClass);
    final int statusCode = response.statusCode;
    if(statusCode==200){

      return userProfile;
    }
    return userProfile;
  }

  Future<dynamic> editUserProfile({
    required String username,
    required String first_name,
    required String last_name,
    required String middle_name,
    required String phone,
    required String additional_phone,
    required int region,
    required String district,
    required String address,
  })async{
    final requestParameters = {
      username: username,
      first_name: first_name,
      last_name: last_name,
      middle_name: middle_name,
      phone:  phone,
      additional_phone: additional_phone,
      region: region,
      district: district,
      address: address
    };
    UserModel userProfile;
    final requestUrl=Uri.parse(BASE_URL.GET_USER_PROFILE);
    final response=await http.put(requestUrl,
        headers: {
          "Content-Type": 'application/json',
          "Authorization":'Token ${Utils.token_generate}'
        },
        body: json.encode(requestParameters));
    final resultClass = json.decode(utf8.decode(response.bodyBytes));
    userProfile= UserModel.fromJson(resultClass);
    final int statusCode = response.statusCode;
    if(statusCode==200){

      return userProfile;
    }
    return userProfile;
  }
}