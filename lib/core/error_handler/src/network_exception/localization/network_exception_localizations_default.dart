import 'package:test_dio/core/error_handler/src/network_exception/localization/network_exception_localizations.dart';

class NetworkErrorLocalizationsDefault implements NetworkErrorLocalizations {
  const NetworkErrorLocalizationsDefault();

  @override
  String get responseException => "response error";

  @override
  String get requestCancelled => "Error while request";

  @override
  String get unexpectedError => "Unexpected error occurred";

  @override
  String get requestTimeout => "Request Timeout";

  @override
  String get noInternetConnection => "No internet connection";

  @override
  String get sendTimeout => "Send Timeout";

  @override
  String get unableToProcessData => "Unexpected error occurred";

  @override
  String get otherException => "Unexpected error occurred";

  @override
  String get receiveTimeout => "Receive Timeout";
}
