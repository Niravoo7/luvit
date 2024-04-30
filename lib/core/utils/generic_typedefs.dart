import 'package:dartz/dartz.dart';
import 'package:luvit/core/error/failure.dart';

typedef EitherDynamic<T> = Future<Either<Failure, T>>;

typedef UserData = Map<String, dynamic>;
