class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override 
  String toString() {
    return "$_prefix: $_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Unable to establish a communication");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request");
}

class UnauthorizedRequest extends AppException{
  UnauthorizedRequest([message]) : super(message, "Unauthorized Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
