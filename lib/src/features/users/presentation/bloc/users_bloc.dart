import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';
import 'package:satyam_assignment/src/features/users/domain/usecases/user_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _userUsecase;
  UserBloc({
    required UserUsecase userUsecase,
  })  : _userUsecase = userUsecase,
        super(UserState.initial()) {
    on<UserFetched>(_getUser);
  }

  FutureOr<void> _getUser(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    final result = await _userUsecase.getUser();

    result.fold(
      (error) => emit(
        state.copyWith(
          status: UserStatus.failed,
          message: error,
        ),
      ),
      (users) => emit(
        state.copyWith(
          status: UserStatus.success,
          userList: users,
        ),
      ),
    );
    return null;
  }
}
