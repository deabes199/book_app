import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/details/logic/cubit/smailr_cubit.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({super.key, required this.items});
  final Items items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetails, arguments: items);
        context.read<SmailerCubit>().getSmailerBook(
            category: items.volumeInfo!.categories!.length.toString());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: items.volumeInfo?.imageLinks?.thumbnail ??
                    AppAssets.imageNotFound,
                height: 120,
                width: 100,
                fit: BoxFit.fill,
              )),
          horzintalSpace(8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vertcalSpace(8),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  items.volumeInfo?.title ?? 'null',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                vertcalSpace(6),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  items.volumeInfo?.authors?.first ?? 'null',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                vertcalSpace(8),
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  items.volumeInfo?.categories?.first ?? 'null',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
