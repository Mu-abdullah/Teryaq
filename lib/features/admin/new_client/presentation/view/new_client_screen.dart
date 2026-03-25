import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/custom_widgets/custom_app_bar.dart';
import '../cubits/new_client_cubit/new_client_cubit.dart';
import '../refactor/new_client_screen_body.dart';

class NewClientScreen extends StatelessWidget {
  const NewClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewClientCubit(),
      child: BlocListener<NewClientCubit, NewClientState>(
        listener: (context, state) {
          NewClientCubit.get(context).controller.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Scaffold(
          appBar: CustomAppBar(title: LangKeys.newClient),
          body: const NewClientScreenBody(),
        ),
      ),
    );
  }
}
