class ApiErrorModel {
  final String? message;

  const ApiErrorModel({this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(message: json['message'] ?? 'Unknown error occurred');
  }
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
