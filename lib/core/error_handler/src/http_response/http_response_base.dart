// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_dio/core/error_handler/error_handler.dart';

/// future value of [HttpResponse]
typedef FutureResponse<T> = Future<HttpResponse<T, dynamic>>;

/// response wrapper
///
/// [response] will be passed to [ErrorHandler]
///
/// - [data] formatted data type of [T]
/// - [response] response value to used it [ResultState.error] of type [RT]
class HttpResponse<T, RT> {
  final T data;

  final ResponseValue<RT> response;

  const HttpResponse(this.data, this.response);

  @override
  String toString() => 'HttpResponse(data: $data, response: $response)';

  HttpResponse<T, RT> copyWith({
    T? data,
    ResponseValue<RT>? response,
  }) {
    return HttpResponse<T, RT>(
      data ?? this.data,
      response ?? this.response,
    );
  }
}

/// real response data
///
/// - [data] any type
/// - [statusCode] Response status code
class ResponseValue<RT> {
  final RT? data;
  final int? statusCode;

  const ResponseValue(this.data, this.statusCode);

  @override
  String toString() => 'ResponseValue(data: $data, statusCode: $statusCode)';

  ResponseValue<RT> copyWith({
    RT? data,
    int? statusCode,
  }) {
    return ResponseValue<RT>(
      data ?? this.data,
      statusCode ?? this.statusCode,
    );
  }
}
