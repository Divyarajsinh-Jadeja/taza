import 'package:taza/taza.dart';

/// User related all api will be done here
class UserRepository extends ApiService {
  // Static instance of the class
  static final UserRepository instance = UserRepository._internal();

  // Private constructor
  UserRepository._internal();

  // Factory method to return the same instance
  factory UserRepository() => instance;

  Future<Either<ErrorResponse, CommonResponse>?> loginUser(Map<String, dynamic> params) async {
    AppController.to.showLoading(true);
    var response = await postMethod<CommonResponse>(ApiClient.loginUser, params, withFullResponse: true);
    AppController.to.showLoading(false);
    return response?.fold((l) => Left(l), (r) => Right(r as CommonResponse));
  }

  Future<Either<ErrorResponse, CommonResponse>?> signUpUser(Map<String, dynamic> params, {Map<String, File>? imageFiles}) async {
    AppController.to.showLoading(true);
    var response = await postMethod<CommonResponse>(ApiClient.registerUser, params, withFullResponse: true);
    AppController.to.showLoading(false);
    return response?.fold((l) => Left(l), (r) => Right(r as CommonResponse));
  }

  Future<Either<ErrorResponse, UserResponse>?> verifyEmail(Map<String, dynamic> params) async {
    AppController.to.showLoading(true);
    var response = await postMethod<UserResponse>(ApiClient.verifyEmail, params);
    AppController.to.showLoading(false);
    return response?.fold((l) => Left(l), (r) => Right(r as UserResponse));
  }
}
