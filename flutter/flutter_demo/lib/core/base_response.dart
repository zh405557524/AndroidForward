class BaseResponse<T> {
  final int code;
  final String message;
  final T data;

  BaseResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return BaseResponse<T>(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: fromJsonT(json['data']),
    );
  }
}
