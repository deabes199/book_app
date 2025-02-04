import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/details/ui/widgets/details/description_text.dart';
import 'package:book_app/feathers/details/ui/widgets/details/image_book.dart';
import 'package:book_app/feathers/details/ui/widgets/details/name_and_auther_book.dart';
import 'package:book_app/feathers/details/ui/widgets/details/preview_button.dart';
import 'package:book_app/feathers/details/ui/widgets/smailer/smailer_bloc_builder.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.bookModel});
  final Items bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBook(
              bookModel: bookModel,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vertcalSpace(10),
                  NameAndAutherBook(
                    title: bookModel.volumeInfo?.title ?? 'null',
                    category: bookModel.volumeInfo?.categories?.first ?? 'null',
                    publisher: bookModel.volumeInfo?.publisher ?? 'null',
                    pages: bookModel.volumeInfo?.pageCount ?? 0,
                    auther: bookModel.volumeInfo?.authors?.join('.') ?? 'null',
                    publisherDate:
                        bookModel.volumeInfo?.publishedDate ?? 'null',
                  ),
                  vertcalSpace(8),
                  PreviewButton(
                    pdfLink: bookModel.volumeInfo?.previewLink ?? 'not',
                    info: bookModel.volumeInfo?.infoLink ?? 'not',
                  ),
                  vertcalSpace(10),
                  DescriptionText(
                    description: bookModel.volumeInfo?.description ?? 'null',
                  ),
                  vertcalSpace(20),
                  const SmailerBookBlocBuilder()
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}





