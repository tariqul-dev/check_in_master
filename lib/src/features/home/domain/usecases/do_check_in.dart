import 'package:check_in_master/src/core/entities/location_data_entity.dart';
import 'package:check_in_master/src/core/entities/user_entity.dart';
import 'package:check_in_master/src/core/usecases/typedefs.dart';
import 'package:check_in_master/src/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../repositories/home_repository.dart';

@Injectable()
class DoCheckIn implements BaseUseCase<CheckInOutInput, UserEntity> {
  final HomeRepository repository;

  DoCheckIn({required this.repository});

  @override
  AsyncResult<UserEntity> call(CheckInOutInput input) {
    return repository.doCheckIn(
      user: input.user,
      activeLocation: input.activeLocation,
    );
  }
}

class CheckInOutInput extends Equatable {
  final UserEntity user;
  final LocationDataEntity activeLocation;

  const CheckInOutInput({required this.user, required this.activeLocation});

  @override
  List<Object?> get props => [user, activeLocation];
}
