part of 'newest_cubit.dart';

@immutable
sealed class NewestState {}

final class NewestInitial extends NewestState {}

final class GetNewsetBookLoading extends NewestState {}

final class GetNewsetPaginationLoading extends NewestState {}

final class GetNewsetBookSuccess extends NewestState {
  final List<Items> items;

  GetNewsetBookSuccess({required this.items});
}

final class GetNewsetBookError extends NewestState {
  final String errMsg;

  GetNewsetBookError(this.errMsg);
}
