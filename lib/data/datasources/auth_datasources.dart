import 'package:flutter_e_catalog/data/models/request/register_request_model.dart';
import 'package:flutter_e_catalog/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  var url = 'https://api.escuelajs.co/api/v1/';
  Future<RegisterResponseModel> register(
      RegisterRequestModel registerRequestModel) async {
    var uri = Uri.parse('${url}users/');
    final response = await http.post(
      uri,
      body: registerRequestModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }
}
