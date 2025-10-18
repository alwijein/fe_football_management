class ErrorResponse {
  bool? status;
  int? code;
  String? message;
  String? detail;

  ErrorResponse({
    this.status,
    this.code,
    this.message,
    this.detail,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        detail: json['detail'] as String?,
      );
}
