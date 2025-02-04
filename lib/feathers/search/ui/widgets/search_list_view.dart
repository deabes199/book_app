import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/ui/widgets/newest/newest_item.dart';
import 'package:flutter/material.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.searchList});
  final List<Items> searchList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Padding(padding: EdgeInsets.only(bottom: 16));
            },
            itemCount: searchList.length,
            itemBuilder: (context, index) {
              return NewestItem(
                items: searchList[index],
              );
            }));
  }
}
