import 'package:book_app/core/routes/routes.dart';
import 'package:book_app/core/utils/app_assets.dart';
import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/details/logic/cubit/smailr_cubit.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key, required this.items});
  final Items items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookDetails, arguments: items);
        context.read<SmailerCubit>().getSmailerBook(
            category: items.volumeInfo!.categories!.length.toString());
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: items.volumeInfo?.imageLinks?.thumbnail ??
                    AppAssets.imageNotFound,
                fit: BoxFit.fill,
                height: 160,
                width: 120,
              ),
            ),
            vertcalSpace(8),
            Flexible(
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                items.volumeInfo?.title ?? 'null',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            vertcalSpace(8),
            Flexible(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                items.volumeInfo?.authors?.first ?? 'null',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
