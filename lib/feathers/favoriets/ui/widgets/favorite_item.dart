import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:book_app/feathers/favoriets/ui/widgets/remove_item_bloc_consumer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.model});
  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: model.thumbnail,
          height: 100,
          width: 100,
        ),
        horzintalSpace(5),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      model.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RemoveItemBlocConsumer(model: model)
                ],
              ),
              Text(
                model.authors,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
}
