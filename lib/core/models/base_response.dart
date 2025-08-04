class BaseResponse<T> {
  final int statusCode;
  final String message;
  final T? data;

  BaseResponse({
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {
    return BaseResponse<T>(
      statusCode: json['status_code'] ?? 200,
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  /// Convert this response back to JSON (optional)
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'status_code': statusCode,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}

//USE Base Response Example

// final response = await dio.post('/login', data: payload);
//
// final baseResponse = BaseResponse.fromJson(
// response.data,
// (json) => LoginModel.fromJson(json as Map<String, dynamic>),
// );
//
// // Now access:
// print(baseResponse.statusCode);
// print(baseResponse.message);
// print(baseResponse.data?.token);