import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/button_bar_cubit.dart';
import '../cubit/button_bar_states.dart';
import '../widgets/widgets/buttonbar.dart';
import '../widgets/widgets/movies_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocProvider(
        create: (context) => ButtonBarCubit(),
        child: BlocBuilder<ButtonBarCubit, ButtonBarStates>(builder: (context, state) {
          final cubit = ButtonBarCubit.get(context);
          final pageIndex = cubit.pageIndex;
          return _buildBody(pageIndex);
        }),
      ),
    );
  }

  Column _buildBody(int pageIndex) {
    return Column(
      children: [
        const ButtonBarWidget(),
        if (pageIndex == 0)
          MoviesListWidget(
            isShowingNow: true,
            key: const Key('true'),
          ),
        if (pageIndex == 1)
          MoviesListWidget(
            isShowingNow: false,
            key: const Key('false'),
          ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Movies',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        DrawerButton(
          onPressed: () {},
        ),
        const Text('|'),
        const SizedBox(width: 15),
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 20,
          // foregroundImage: AssetImage('assets/images/messi.jpg'),
        ),
        const SizedBox(width: 18)
      ],
    );
  }
}
