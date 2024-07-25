import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:satyam_assignment/src/features/users/data/datasources/post_datasource.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';
import 'package:satyam_assignment/src/features/users/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource todoDataSource})
      : _userDataSource = todoDataSource;

  @override
  Future<Either<String, List<User>>> getUser() async {
    try {
      final user = await _userDataSource.getUsers();
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
