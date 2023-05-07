class Endpoints {
  Endpoints._();

  static const String baseURL = 'http://10.0.3.2:7000';
  static const String baseAuth= '/auth';
  static const String baseAPI= '/api/v1';

  static const Duration receiveTimeout = Duration(seconds: 3);
  static const Duration connectionTimeout = Duration(seconds: 5);
  ///Auth
  static const String renewToken = '$baseAuth/renew';
  static const String login = '$baseAuth/login';
  static const String registerCustomer = '/auth/register/customer';
  static const String registerDeliveryMan = '$baseAuth/register/deliveryman';
  static const String verifyUser = '$baseAuth/verify';
  ///Users
  static const String users = '$baseAPI/users';
  static const String me = '$users/user/me';
  static const String editUser = '$users/user/edit';

  ///TEST
  static const String testURL = 'https://jsonplaceholder.typicode.com';
  static const String test = '/posts';}
