import 'package:dartz/dartz.dart';

import '../errors/failures/failures.dart';

typedef Result<T extends Object> = Either<T, Failure>;
typedef AsyncResult<T extends Object> = Future<Result<T>>;
