import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button_bar_cubit.dart';
import '../../cubit/button_bar_states.dart';

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBarCubit, ButtonBarStates>(
      builder: (context, state) {
        var cubit = ButtonBarCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShowingNowButton(cubit, context),
            _buildComingSoonButton(cubit, context),
          ],
        );
      },
    );
  }

  TextButton _buildShowingNowButton(ButtonBarCubit cubit, BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: cubit.pageIndex == 0 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withOpacity(0),
            ),
          ),
        ),
        backgroundColor: cubit.pageIndex == 0
            ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
            : MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.3)),
      ),
      onPressed: () {
        cubit.showingNowMovies();
      },
      child: Text(
        ' Showing Now ',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  TextButton _buildComingSoonButton(ButtonBarCubit cubit, BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: cubit.pageIndex == 1 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withOpacity(0),
            ),
          ),
        ),
        backgroundColor: cubit.pageIndex == 1
            ? MaterialStateProperty.all(Theme.of(context).colorScheme.primary)
            : MaterialStateProperty.all(Theme.of(context).colorScheme.primary.withOpacity(0.3)),
      ),
      onPressed: () {
        cubit.comingSoonMovies();
      },
      child: Text(
        ' Coming Soon ',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
