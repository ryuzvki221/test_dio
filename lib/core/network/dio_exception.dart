import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioErrorType.badResponse:
        errorMessage = _handleStatusCode(
            dioError.response?.data['message'], dioError.response?.statusCode);
        break;
      case DioErrorType.connectionError:
        errorMessage = 'Connection failed due to internet connection.';
        break;
      case DioErrorType.unknown:
        errorMessage = dioError.response?.data['message'] ??
            'Unexpected error occurred.';
        break;

      default:
        errorMessage = dioError.response?.data['message'] ??
            'Unexpected error occurred.';
        break;
    }
  }

  String _handleStatusCode(String? message, int? statusCode) {
    switch (statusCode) {
      case 400:
        return message ?? 'Bad request.';
      case 401:
        return message ?? 'Authentication failed.';
      case 403:
        return message ??
            'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return message ?? 'The requested resource does not exist.';
      case 405:
        return  message ?? 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return  message ?? 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return  message ?? 'Data validation failed.';
      case 429:
        return  message ?? 'Too many requests.';
      case 500:
        return message ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
