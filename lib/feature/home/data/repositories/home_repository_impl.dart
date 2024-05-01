import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:luvit/core/error/exceptions.dart';
import 'package:luvit/core/error/failure.dart';
import 'package:luvit/core/shared/presentation/controller/check_internet_controller.dart';
import 'package:luvit/core/utils/generic_typedefs.dart';
import 'package:luvit/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDataSource});

  final HomeRemoteDataSource homeRemoteDataSource;
  final checkInternetController = Get.find<CheckInternetController>();

  @override
  EitherDynamic<Stream<List<CardModel>>> getCardList() async{
    if (checkInternetController.isConnected.value) {
      try {
        final data = homeRemoteDataSource.getCardList();

        if (await data.isEmpty) {
          return Left(GeneralFailure(error: "Goals are not exist"));
        } else {
          return Right(data);
        }
        return Right(data);
      } on ServerException catch (e) {
        return Left(ServerFailure(error: e.error));
      }
    } else {
      return Left(GeneralFailure(error: "strNoInternetError".tr));
    }
  }
}
