class RegisterResponseModel {
  final bool success;
  final String message;
  final List<Map<String, dynamic>> data;

  RegisterResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      success: json['success'],
      data: List<Map<String, dynamic>>.from(json['data']),
    );
  }
}
