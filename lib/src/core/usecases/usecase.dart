import 'typedefs.dart';

abstract class BaseUseCase<TInput extends Object, TOutput extends Object> {
  const BaseUseCase();
  AsyncResult<TOutput> call(TInput input);
}
