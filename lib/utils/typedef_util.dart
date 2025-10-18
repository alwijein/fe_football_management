import 'package:fe_football/app/data/dto/error_dto.dart';
import 'package:dartz/dartz.dart';

typedef EitherError<T> = Either<ErrorDto, T>;
typedef FutureOrError<T> = Future<EitherError<T>>;
