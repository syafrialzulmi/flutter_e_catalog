import 'dart:convert';

import 'package:flutter_e_catalog/common/constants/variables.dart';
import 'package:flutter_e_catalog/data/models/request/product_request_model.dart';
import 'package:flutter_e_catalog/data/models/response/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasources {
  Future<ProductResponseModel> createProduct(
      ProductRequestModel productRequestModel) async {
    var uri = Uri.parse('${Variables.baseUrl}/products/');
    final response = await http.post(
      uri,
      body: productRequestModel.toMap(),
    );

    final result = ProductResponseModel.fromJson(response.body);
    return result;
  }

  Future<ProductResponseModel> updateProduct(
      ProductRequestModel productRequestModel, int id) async {
    var uri = Uri.parse('${Variables.baseUrl}/products/$id ');
    final response = await http.put(
      uri,
      body: productRequestModel.toMap(),
    );

    final result = ProductResponseModel.fromJson(response.body);
    return result;
  }

  Future<ProductResponseModel> getProductById(int id) async {
    var uri = Uri.parse('${Variables.baseUrl}/products/$id');
    final response = await http.get(
      uri,
    );

    final result = ProductResponseModel.fromJson(response.body);
    return result;
  }

  Future<List<ProductResponseModel>> getProductAll() async {
    var uri = Uri.parse('${Variables.baseUrl}/products');
    final response = await http.get(
      uri,
    );

    final result = List<ProductResponseModel>.from(jsonDecode(response.body)
        .map((e) => ProductResponseModel.fromMap(e))).toList();

    return result;
  }
}
