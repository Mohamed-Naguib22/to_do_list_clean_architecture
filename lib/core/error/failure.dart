import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.statusCode});

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with server',
            statusCode: e.response!.statusCode);

      case DioExceptionType.sendTimeout:
        return const ServerFailure(message: 'Send timeout.');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure(message: 'Receive timeout.');

      case DioExceptionType.badCertificate:
        return const ServerFailure(message: 'Cannot connect to server!');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Cannot connect to server! please try again');

      case DioExceptionType.connectionError:
        return const ServerFailure(message: 'No Internet Connection');

      case DioExceptionType.unknown:
        return const ServerFailure(message: 'Ops! There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return const ServerFailure(message: 'Your request was not found, please try later');
    }else if(statusCode == 401){
      return const ServerFailure(message: 'Authentication is required and has failed, or credentials are missing.');
    }
    else if (statusCode == 500) {
      return const ServerFailure(message: 'Internal Server Error, please try later');
    }else if(statusCode == 403){
      return  ServerFailure(message: response['message']);
    }
    else if (statusCode == 400) {
      return const ServerFailure(message: 'There\'s something error! please try again later');
    }
    else if (statusCode == 409) {
      return const ServerFailure(message: 'Resource conflict. Unable to fulfill the request.');
    }
    else {
      return const ServerFailure(message: 'There was an error, please try again');
    }
  }
}