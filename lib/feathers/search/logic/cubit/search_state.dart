part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<Items> bookList;

  SearchSuccessState({required this.bookList});
}

final class SearchErrorState extends SearchState {
  final String errorMsg;

  SearchErrorState({required this.errorMsg});
}
