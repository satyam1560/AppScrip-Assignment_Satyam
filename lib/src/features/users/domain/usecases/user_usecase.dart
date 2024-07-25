import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';
import 'package:satyam_assignment/src/features/users/domain/repositories/user_repository.dart';

@LazySingleton()
class UserUsecase implements UserRepository {
  UserUsecase({required UserRepository userRepo}) : _userUsecase = userRepo;
  final UserRepository _userUsecase;
  @override
  Future<Either<String, List<User>>> getUser() async {
    return await _userUsecase.getUser();
  }
}
