class ApiErrorModel {
  final String? message;
  final int? code;

  const ApiErrorModel({this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] ?? 'Unknown error occurred',
      code: json['status'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': code,
    };
  }
}
