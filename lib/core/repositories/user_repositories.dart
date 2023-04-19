

import 'package:online_test/models/user_model/user_model.dart';

import '../api_service/api_service.dart';
import '../constants/url_constants.dart';

class UserRepository {
  final BASE_URL _mediaService = MediaService();

  Future<List<UserModel>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.getResponse(value);
    final jsonData = response['results'] as List;
    List<UserModel> mediaList =
    jsonData.map((tagJson) => UserModel.fromJson(tagJson)).toList();
    return mediaList;
  }
}
