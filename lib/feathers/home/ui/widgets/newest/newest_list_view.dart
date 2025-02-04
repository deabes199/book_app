import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/logic/cubit/newest/newest_cubit.dart';
import 'package:book_app/feathers/home/ui/widgets/newest/newest_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.newestList});
  final List<Items> newestList;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  late final ScrollController controller;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        scrollListener();
      }
    });
    super.initState();
  }

  void scrollListener() async {
    if (!isLoading) {
      isLoading = true;

      await context.read<NewestCubit>().getNewestlBook(page: nextPage++);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            controller: controller,
            separatorBuilder: (context, index) {
              return const Padding(padding: EdgeInsets.only(bottom: 16));
            },
            itemCount: widget.newestList.length,
            itemBuilder: (context, index) {
              return NewestItem(
                items: widget.newestList[index],
              );
            }));
  }
}
