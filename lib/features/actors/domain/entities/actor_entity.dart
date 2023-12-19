import 'package:equatable/equatable.dart';

class ActorEntity extends Equatable {
  final String name;
  final String? actorImage;

  const ActorEntity({required this.name, this.actorImage});

  @override
  List<Object?> get props => [name, actorImage];
}
