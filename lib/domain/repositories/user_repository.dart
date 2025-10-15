import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/user.dart';

// Repository contract - defines what operations are available
abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
}