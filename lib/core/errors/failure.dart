import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class SereverFailure extends Failure {
  SereverFailure(super.errorMessage);

  factory SereverFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return SereverFailure('Connection time out with api server');
      case DioExceptionType.sendTimeout:
        return SereverFailure('Send time out with api server');
      case DioExceptionType.receiveTimeout:
        return SereverFailure('Receive time out with api server');
      case DioExceptionType.badCertificate:
        return SereverFailure('bad Certificate  with api server');
      case DioExceptionType.badResponse:
        return SereverFailure.fromResponse( dioError.response!.statusCode, dioError.response!.data,);
      case DioExceptionType.cancel:
        return SereverFailure('request canceld with api server');
      case DioExceptionType.connectionError:
        return SereverFailure('connection error please check your internet');
      case DioExceptionType.unknown:
       return SereverFailure('unknown error we are sorry please try again');
       default:
        return SereverFailure('unknown error we are sorry please try again');
       
    }
  }

  factory SereverFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return SereverFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return SereverFailure('Your request not found try again later');
    } else if (statusCode == 500) {
      return SereverFailure('Server error try again later');
    } else {
      return SereverFailure('Oops there was an error, try again later');
    }
  }
}
