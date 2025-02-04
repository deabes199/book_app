import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/logic/cubit/newest/newest_cubit.dart';
import 'package:book_app/feathers/home/ui/widgets/newest/newest_list_view.dart';
import 'package:book_app/feathers/home/ui/widgets/newest/newset_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewesBlocBuilder extends StatelessWidget {
  const NewesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Items> newst = [];
    return BlocBuilder<NewestCubit, NewestState>(builder: (context, state) {
      print(state);
      if (state is GetNewsetBookSuccess) {
        newst.addAll(state.items);
        return NewestBooksListView(
          newestList: newst,
        );
      } else if (state is GetNewsetBookLoading) {
        return const NewsetShimmer();
      }
       else if (state is GetNewsetPaginationLoading) {
        return Column(
          children: [
            NewestBooksListView(
              newestList: newst,
            ),
             NewsetShimmer(),

          ],
        );
      } 
      else if (state is GetNewsetBookError) {
        return Center(
          child: Text(state.errMsg),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
