import 'package:dartz/dartz.dart';

import '../errors/failures/base_failure.dart';

typedef Result<T extends Object> = Either<T, BaseFailure>;
typedef AsyncResult<T extends Object> = Future<Result<T>>;
