import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/details/ui/widgets/smailer/smailer_item.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class SmailerBooksListView extends StatelessWidget {
  const SmailerBooksListView({super.key, required this.smailerList});
  final List<Items> smailerList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Smailer Book',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        vertcalSpace(16),
        SizedBox(
          height: 130,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Padding(padding: EdgeInsets.only(right: 20));
            },
            scrollDirection: Axis.horizontal,
            itemCount: smailerList.length,
            itemBuilder: (context, index) {
              return SmailerItem(
                book: smailerList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
