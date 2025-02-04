part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class RemoveItemState extends FavoriteState {
   final List<FavoriteModel> favList;

  RemoveItemState({required this.favList});
}

final class AddItemState extends FavoriteState {}

final class GetItemState extends FavoriteState {
 final List<FavoriteModel> favList;

  GetItemState({required this.favList});
}

final class ClearsItemsState extends FavoriteState {
  final List<FavoriteModel> favList;

  ClearsItemsState({required this.favList});
}
