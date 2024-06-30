class LoginResponseModel {
  final String message;
  final UserData data;
  final bool status;
  final int code;

  LoginResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      data: UserData.fromJson(json['data']),
      status: json['status'],
      code: json['code'],
    );
  }
}

class UserData {
  final String accessToken;
  final String refreshToken;

  UserData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
