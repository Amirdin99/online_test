import 'package:flutter/cupertino.dart';

import '../core/api_service/api_response.dart';
import '../core/repositories/user_repositories.dart';
import '../models/user_model/user_model.dart';

class AuthViewModel extends ChangeNotifier{

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');



  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> fetchMediaData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List<UserModel> mediaList = await UserRepository().fetchMediaList(value);
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

}