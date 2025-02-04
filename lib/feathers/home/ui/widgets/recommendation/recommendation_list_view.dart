import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/logic/cubit/recommended/recommended_cubit.dart';
import 'package:book_app/feathers/home/ui/widgets/recommendation/recommended_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationListView extends StatefulWidget {
  const RecommendationListView({super.key, required this.recomendedList});

  final List<Items> recomendedList;

  @override
  State<RecommendationListView> createState() => _RecommendationListViewState();
}

class _RecommendationListViewState extends State<RecommendationListView> {
  int nextPage = 1;
  bool isLoading = false;
  late final ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        scrollPage();
      }
    });
    super.initState();
  }

  void scrollPage() async {
    if (!isLoading) {
      isLoading = true;
      await context.read<RecommendedCubit>().getProgrammingBook(page: nextPage++);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.recomendedList.length,
          itemBuilder: (context, index) {
            return RecommendedItem(
              items: widget.recomendedList[index],
            );
          }),
    );
  }
}
