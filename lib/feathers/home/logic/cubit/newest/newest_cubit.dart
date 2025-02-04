import 'package:bloc/bloc.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit(this.homeRepo) : super(NewestInitial());
  final HomeRepo homeRepo;

  getNewestlBook({int page = 0}) async {
    if (page == 0) {
      emit(GetNewsetBookLoading());
    } else {
      GetNewsetPaginationLoading();
    }

    final response = await homeRepo.getNewestBook(page: page);
    response.fold((error) {
      emit(GetNewsetBookError(error.message));
    }, (general) {
      emit(GetNewsetBookSuccess(items: general.items));
    });
  }
}
