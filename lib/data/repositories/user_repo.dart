import 'package:delivery_app/data/api/api_client.dart';
import 'package:delivery_app/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
