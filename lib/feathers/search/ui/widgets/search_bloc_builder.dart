import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/feathers/search/logic/cubit/search_cubit.dart';
import 'package:book_app/feathers/search/ui/widgets/search_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookBlocBuilder extends StatelessWidget {
  const SearchBookBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is SearchSuccessState) {
          return SearchListView(searchList: state.bookList);
        } else if (state is SearchErrorState) {
          return Text(state.errorMsg);
        } else if (state is SearchInitial) {
          return Image.asset(AppAssets.notFound);
        }
        return const SizedBox.square();
      },
    );
  }
}
