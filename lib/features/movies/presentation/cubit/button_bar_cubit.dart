import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_app/features/movies/presentation/cubit/button_bar_states.dart';

class ButtonBarCubit extends Cubit<ButtonBarStates> {
  ButtonBarCubit() : super(ButtonBarInitState());

  static ButtonBarCubit get(context) => BlocProvider.of(context);

  int pageIndex = 0;

  void showingNowMovies() {
    pageIndex = 0;
    emit(ButtonBarShowingNow());
  }

  void comingSoonMovies() {
    pageIndex = 1;
    emit(ButtonBarComingSoon());
  }
}
