import 'package:flutter_e_catalog/common/constants/variables.dart';
import 'package:flutter_e_catalog/data/localsources/auth_local_storage.dart';
import 'package:flutter_e_catalog/data/models/request/login_request_model.dart';
import 'package:flutter_e_catalog/data/models/request/register_request_model.dart';
import 'package:flutter_e_catalog/data/models/response/login_response_model.dart';
import 'package:flutter_e_catalog/data/models/response/profile_response_model.dart';
import 'package:flutter_e_catalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasources {
  Future<RegisterResponseModel> register(
      RegisterRequestModel registerRequestModel) async {
    var uri = Uri.parse('${Variables.baseUrl}/users');
    final response = await http.post(
      uri,
      body: registerRequestModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    var uri = Uri.parse('${Variables.baseUrl}/auth/login');
    final response = await http.post(
      uri,
      body: loginRequestModel.toMap(),
    );

    final result = LoginResponseModel.fromJson(response.body);
    return result;
  }

  Future<ProfileResponseModel> getProfil() async {
    final token = await AuthLocalStorage().getToken();
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var uri = Uri.parse('${Variables.baseUrl}/auth/profile');
    final response = await http.get(
      uri,
      headers: headers,
    );

    final result = ProfileResponseModel.fromJson(response.body);
    return result;
  }
}
