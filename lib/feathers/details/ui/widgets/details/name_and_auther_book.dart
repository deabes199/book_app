import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/details/ui/widgets/details/custom_text.dart';
import 'package:flutter/material.dart';

class NameAndAutherBook extends StatelessWidget {
  const NameAndAutherBook(
      {super.key,
      required this.title,
      required this.category,
      required this.publisher,
      required this.pages,
      required this.auther,
      required this.publisherDate});
  final String title;
  final String category;
  final String auther;
  final String publisher;
  final int pages;
  final String publisherDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        vertcalSpace(7),
        CustomText(
          title: 'Auther',
          subTitle: auther,
        ),
        CustomText(
          title: 'Category',
          subTitle: category,
        ),
        CustomText(
          title: 'Publisher',
          subTitle: publisher,
        ),
        CustomText(
          title: 'published Date',
          subTitle: publisherDate,
        ),
        CustomText(
          title: 'Pages',
          subTitle: pages.toString(),
        ),
      ],
    );
  }
}
