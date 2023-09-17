import 'package:dartz/dartz.dart';
import 'package:restaurant_menu/core/errors/exception.dart';
import 'package:restaurant_menu/core/errors/failures.dart';
import 'package:restaurant_menu/core/network/connectivity.dart';
import 'package:restaurant_menu/feature/menu_management/data/datasources/remote/menu_management_remote_datasource.dart';
import 'package:restaurant_menu/feature/menu_management/data/models/response_model/category_response_model.dart';
import 'package:restaurant_menu/feature/menu_management/domain/repository/menu_management_repository.dart';

class MenuManagementRepositoryImpl extends MenuManagementRepository {
  MenuManagementRepositoryImpl(
    this._api,
    this.connectivityService,
  );

  final MenuManagementRemoteApi _api;
  final ConnectivityService connectivityService;

  @override
  Future<Either<Failure, List<CategoryResponseModel>>> getCategories() async {
    try {
      if (!connectivityService.hasInternet) {
        return Left(NetworkFailure());
      }

      final resp = await _api.getCategories();

      return Right(resp);
    } catch (ex) {
      if (ex is ServerException) {
        return Left(ServerFailure(message: ex.message));
      } else {
        return Left(OtherFailure());
      }
    }
  }
}
