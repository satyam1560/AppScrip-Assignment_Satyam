part of 'users_bloc.dart';

enum UserStatus { initial, loading, success, failed }

class UserState extends Equatable {
  const UserState({
    required this.status,
    this.userList = const [],
    this.message = '',
  });
  final UserStatus status;
  final List<User>? userList;
  final String? message;

  @override
  List<Object?> get props => [status, userList, message];
  factory UserState.initial() => const UserState(status: UserStatus.initial);

  UserState copyWith({
    UserStatus? status,
    List<User>? userList,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      userList: userList ?? this.userList,
      message: message ?? this.message,
    );
  }
}
