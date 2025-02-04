import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SmailerItem extends StatelessWidget {
  const SmailerItem({super.key, required this.book});
  final Items book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.bookDetails,
                arguments: book);
          },
          child: CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                  book.volumeInfo?.imageLinks?.smallThumbnail ??
                      AppAssets.imageNotFound)),
        ),
        SizedBox(
          width: 70,
          child: Text(
            book.volumeInfo?.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
