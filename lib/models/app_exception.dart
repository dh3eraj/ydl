class AppException implements Exception {
  final String message;
  AppException({this.message = "Something Went Wrong"});
}

class InternetException extends AppException {
  InternetException({super.message = "No Internet"});
}
class RequestTimeOutException extends AppException {
  RequestTimeOutException({super.message = "Request Time Out"});
}
class UserNotFoundException extends AppException {
  UserNotFoundException({super.message = "User Not Found"});
}