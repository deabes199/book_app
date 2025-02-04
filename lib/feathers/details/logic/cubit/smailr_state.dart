part of 'smailr_cubit.dart';

@immutable
sealed class SmailerState {}

final class SmailrInitial extends SmailerState {}

final class SmailrLoadingState extends SmailerState {}

final class SmailrSuccessState extends SmailerState {
  final List<Items> smailerList;

  SmailrSuccessState({required this.smailerList});
}

final class SmailrErrorState extends SmailerState {
  final String errorMsg;

  SmailrErrorState( this.errorMsg);
}
