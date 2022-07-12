import 'package:delivery_app/data/repositories/user_repo.dart';
import 'package:get/get.dart';

import '../data/repositories/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signup_body_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    _isLoading = false;

    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successfully');
      _userModel = UserModel.fromJson(response.body);
      print('ID : ' + _userModel.id.toString());
    } else {
      print('REQUEST FAILED');
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
