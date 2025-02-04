import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/widgets/custom_circle_button.dart';
import 'package:book_app/feathers/details/ui/widgets/details/add_favorite_bloc_consumer.dart';
import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBook extends StatelessWidget {
  const ImageBook({super.key, required this.bookModel});

  final Items bookModel;

  @override
  Widget build(BuildContext context) {
    FavoriteModel book = FavoriteModel(
      id: bookModel.id ?? '',
      title: bookModel.volumeInfo?.title ?? '',
      thumbnail:
          bookModel.volumeInfo?.imageLinks?.thumbnail ?? AppAssets.notFound,
      authors: bookModel.volumeInfo?.authors?.first ?? '',
    );
    return Stack(children: [
      SizedBox(
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                AppAssets.imageNotFound,
            height: 250,
          )),
      Padding(
        padding: const EdgeInsets.only(right: 12, top: 10, left: 10),
        child: Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              CustomCircleButton(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              AddFavoriteBlocConsumer(book: book),
            ],
          ),
        ),
      )
    ]);
  }
}
