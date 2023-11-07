import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY5OTMyNzUyNiwiZXhwIjoxNzAxMDU1NTI2fQ.s_eqqOK6FU5hZUsbupIxg2gxvTjegTBUNhPpx6ydLjI",
//     "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTY5OTMyNzUyNiwiZXhwIjoxNjk5MzYzNTI2fQ.CUfXuDLVdE48AKs31RC2ujOoaScLO21_u_NMnyuqKBg"
// }

class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
