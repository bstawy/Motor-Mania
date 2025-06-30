class UserData {
  final String id;
  final String name;
  final String email;
  final UserTokens tokens;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.tokens,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      tokens: UserTokens.fromJson(json['tokens']),
    );
  }
}

class UserTokens {
  final String accessToken;
  final String refreshToken;

  UserTokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserTokens.fromJson(Map<String, dynamic> json) {
    return UserTokens(
      accessToken: json['access_token'] ?? "",
      refreshToken: json['refresh_token'] ?? "",
    );
  }
}
