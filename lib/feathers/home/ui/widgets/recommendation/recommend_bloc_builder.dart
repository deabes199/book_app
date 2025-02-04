import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/logic/cubit/recommended/recommended_cubit.dart';
import 'package:book_app/feathers/home/ui/widgets/recommendation/recommendation_list_view.dart';
import 'package:book_app/feathers/home/ui/widgets/recommendation/shimmer_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RecommendationBlocBuilder extends StatelessWidget {
  RecommendationBlocBuilder({super.key});
  List<Items> recList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedCubit, RecommendedState>(
      builder: (context, state) {
        if (state is GetProgramminBookSuccess) {
          recList.addAll(state.items);
          return RecommendationListView(recomendedList:recList);
        } else if (state is GetProgramminBookLoading) {
          return const RecommendedShimmer();
        } else if (state is GetPaginationLoading) {
          return  RecommendationListView(recomendedList:recList);
        } else if (state is GetProgramminBookError) {
          return Center(
            child: Text(state.errMsg),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

