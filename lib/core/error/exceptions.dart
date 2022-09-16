import 'package:movies_app/core/network/error_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception{
  final String message;
  const LocalDatabaseException(this.message);
}