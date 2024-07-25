import 'package:dartz/dartz.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, List<User>>> getUser();
}
