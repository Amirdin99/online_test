import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/url_constants.dart';

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
    required int org_id,
    required String org_name,
  }) async {
    final requestParameters = {
      "password": password,
      "username": username,
      "first_name": first_name,
      "last_name": last_name,
      "middle_name": middle_name,
      "phone": phone,
      "org_id": org_id,
      "org_name": org_name,
    };

    final String baseUrl = BASE_URL.SIGN_UP_API;
    final requestUrl = Uri.parse(baseUrl);
    final response = await http.post(requestUrl,
        headers: {
          "Content-Type": 'application/json',
        },
        body: json.encode(requestParameters));

    final int statusCode = response.statusCode;

    var resultClass = json.decode(utf8.decode(response.bodyBytes));
    print(statusCode);
    print(resultClass);
  }

  Future<dynamic> userSignIn(
      {required String password, required String username}) async {
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

    var resultClass = json.decode(utf8.decode(response.bodyBytes));
    print(statusCode);
    print(resultClass);
  }
}
