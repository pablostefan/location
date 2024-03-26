import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:location/src/ui/error/app_error.dart';

Future<Either<AppError, T>> executeWithCatch<T>(Future Function() func) async {
  try {
    return Right(await func.call());
  } on DioException catch (error) {
    return Left(AppError.fromDioException(error));
  }
}
