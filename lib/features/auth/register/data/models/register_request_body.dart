class RegisterRequestBody {
  final String name;
  final String email;
  final String password;
  final String verifyCode;

  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    this.verifyCode = "123456",
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'verifyCode': verifyCode,
    };
  }
}
