import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:book_app/feathers/favoriets/logic/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveItemBlocConsumer extends StatelessWidget {
  const RemoveItemBlocConsumer({super.key, required this.model});
  final FavoriteModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is RemoveItemState) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.grey,
              content: Text('Book is Removed'),
            ),
          );
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<FavoriteCubit>().deleteItem(model);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
