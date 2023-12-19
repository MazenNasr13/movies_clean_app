import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {}

class GetAllMoviesEvent extends MoviesEvent {
  final bool isShowingNow;
  GetAllMoviesEvent({required this.isShowingNow});

  @override
  List<Object?> get props => [isShowingNow];
}
