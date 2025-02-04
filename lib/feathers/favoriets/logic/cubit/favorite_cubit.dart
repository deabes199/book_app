import 'package:bloc/bloc.dart';
import 'package:book_app/core/database/hive_services.dart';
import 'package:book_app/feathers/favoriets/data/models/favorite_model.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<FavoriteModel> favoritesList = [];

  void addItemInFavorite(FavoriteModel book) async {
    if (isBookInFavorite(book)) {
      await HiveService.deleteItem(book.id);
      favoritesList.removeWhere((e) => e.id == book.id);
      emit(RemoveItemState(favList: favoritesList));
    } else {
      favoritesList.add(book);
      await HiveService.addItem(book: book);

      emit(AddItemState());
    }
  }

  bool isBookInFavorite(FavoriteModel book) {
    return favoritesList.any((element) => element.id == book.id);
  }

  void getFavorite() async {
    List<FavoriteModel> savedList = await HiveService.getItems();
    favoritesList = savedList;
    emit(GetItemState(favList: favoritesList));
  }

  Future<void> deleteItem(FavoriteModel book) async {
    await HiveService.deleteItem(book.id);
    favoritesList.removeWhere((elment) => elment.id == book.id);

    emit(RemoveItemState(favList: favoritesList));
  }

  Future<void> clearAllItems() async {
    await HiveService.clearAllItems();
    favoritesList.clear();
    emit(ClearsItemsState(favList: favoritesList));
  }
}
