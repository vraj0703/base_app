import 'package:dart_either/dart_either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/core/repository/json_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:base_app/project/domain/exceptions/exception.dart';


@Injectable(as: ILocalJsonRepository)
class LocalJsonRepository extends ILocalJsonRepository {
  LocalJsonRepository();

  @override
  Future<Either<Exception, String>> jsonStringFromLocal(String path) async {
    try {
      return Right(await rootBundle.loadString(path));
    } on FlutterError catch (e) {
      return Left(LoadingJsonException(e.message));
    }
  }

  @override
  Future<Either<Exception, T>> executeGET<T>({
    required String jsonPath,
    required T Function(String) transformer,
    void Function(Exception)? onError,
  }) async {
    try {
      var response = await rootBundle.loadString(jsonPath);
      return Right(transformer(response));
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      }
      return Left(e);
    } catch (error) {
      return Left(LoadingJsonException(error.toString()));
    }
  }
}
