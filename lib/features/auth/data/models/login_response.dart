class LoginResponse {
  final String message;
  final String token;
  final String name;
  final int statusCode;
  final bool status;

  LoginResponse({
    required this.message,
    required this.token,
    required this.name,
    required this.statusCode,
    required this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      token: json['token'],
      name: json['name'],
      statusCode: json['statusCode'],
      status: json['status'],
    );
  }
}
