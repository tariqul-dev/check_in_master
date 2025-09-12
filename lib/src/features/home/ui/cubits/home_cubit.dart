import 'package:bloc/bloc.dart';
import 'package:check_in_master/src/core/params/no_params.dart';
import 'package:check_in_master/src/features/home/domain/usecases/do_check_in.dart';
import 'package:check_in_master/src/features/home/domain/usecases/do_check_out.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';


part 'home_state.dart';

part 'home_cubit.freezed.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  final DoCheckIn doCheckIn;
  final DoCheckOut doCheckOut;

  HomeCubit(this.doCheckIn, this.doCheckOut)
    : super(const HomeState.initial());

}
