part of 'recommended_cubit.dart';

@immutable
sealed class RecommendedState {}

final class HomeInitial extends RecommendedState {}

final class GetProgramminBookLoading extends RecommendedState {}
final class GetPaginationLoading extends RecommendedState {}

final class GetProgramminBookSuccess extends RecommendedState {
  final List<Items> items;

  GetProgramminBookSuccess({required this.items});
}

final class GetProgramminBookError extends RecommendedState {
  final String errMsg;

  GetProgramminBookError(this.errMsg);
}




// final class GetGeneralBookLoading extends HomeState {}

// final class GetGeneralBookSuccess extends HomeState {}

// final class GetGeneralBookError extends HomeState {
//   final String errMsg;

//   GetGeneralBookError(this.errMsg);
// }
