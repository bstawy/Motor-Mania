class RegisterResponseModel {
  final String message;
  final List<Map<String, dynamic>> data;
  final bool status;
  final int code;

  RegisterResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      data: List<Map<String, dynamic>>.from(json['data']),
      status: json['status'],
      code: json['code'],
    );
  }
}
