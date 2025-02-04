import 'package:bloc/bloc.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/search/data/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchBook(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoadingState());
    final response = await searchRepo.searchBooks(query: query);
    response.fold((error) {
      emit(SearchErrorState(errorMsg: error.message));
    }, (searchList) {
      final savedList = searchList.items
          .where((searchList) =>
              searchList.volumeInfo?.title != null &&
              searchList.volumeInfo!.title!
                  .toUpperCase()
                  .startsWith(query.toUpperCase()))
          .toList();
      if (savedList.isEmpty) {
        emit(SearchInitial());
      }
      emit(SearchSuccessState(bookList: savedList));
    });
  }

}
