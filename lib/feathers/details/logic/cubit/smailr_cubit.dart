import 'package:bloc/bloc.dart';
import 'package:book_app/feathers/details/data/repo/smailr_repo.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:meta/meta.dart';

part 'smailr_state.dart';

class SmailerCubit extends Cubit<SmailerState> {
  SmailerCubit(this.smailrRepo) : super(SmailrInitial());
  final SmailerRepo smailrRepo;
  Future<void> getSmailerBook({String category = 'general'}) async {
    emit(SmailrLoadingState());
    final response = await smailrRepo.getSmailrBook(category: category);
    response.fold((error) {
      emit(SmailrErrorState(error.message));
    }, (smailerList) {
      emit(SmailrSuccessState(smailerList: smailerList.items));
    });
  }
}
