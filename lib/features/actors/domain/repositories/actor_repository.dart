import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/actor_entity.dart';

abstract class ActorsRepository {
  Future<Either<Failure, List<ActorEntity>>> getAllActors();
}
