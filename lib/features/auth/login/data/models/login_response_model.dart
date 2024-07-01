class LoginResponseModel {
  final bool success;
  final String message;
  final UserData? data;

  LoginResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
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
      accessToken: json['access_token'] ?? "",
      refreshToken: json['refresh_token'] ?? "",
    );
  }
}
