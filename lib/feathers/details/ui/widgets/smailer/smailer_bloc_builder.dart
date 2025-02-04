import 'package:book_app/feathers/details/logic/cubit/smailr_cubit.dart';
import 'package:book_app/feathers/details/ui/widgets/smailer/smailer_list_view.dart';
import 'package:book_app/feathers/details/ui/widgets/smailer/smailer_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmailerBookBlocBuilder extends StatelessWidget {
  const SmailerBookBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmailerCubit, SmailerState>(
      builder: (context, state) {
        if (state is SmailrSuccessState) {
          return SmailerBooksListView(smailerList: state.smailerList);
        } else if (state is SmailrLoadingState) {
          return const SmailerShimmer();
        } else if (state is SmailrErrorState) {
          return Text(state.errorMsg);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}