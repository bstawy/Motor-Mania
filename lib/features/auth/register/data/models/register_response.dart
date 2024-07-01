class RegisterResponseModel {
  final String message;
  final List<Map<String, dynamic>> data;
  final bool success;

  RegisterResponseModel({
    required this.message,
    required this.data,
    required this.success,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'],
      data: List<Map<String, dynamic>>.from(json['data']),
      success: json['success'],
    );
  }
}
