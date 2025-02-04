import 'package:bloc/bloc.dart';
import 'package:book_app/feathers/home/data/models/book_model.dart';
import 'package:book_app/feathers/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;

  getProgrammingBook({int page = 0}) async {
    if (page == 0) {
      emit(GetProgramminBookLoading());
    } else {
      GetPaginationLoading();
    }

    final response = await homeRepo.getProgrammingBook(page: page);

    response.fold((error) {
      emit(GetProgramminBookError(error.message));
    }, (list) {
      emit(GetProgramminBookSuccess(items: list.items));
    });
  }
}
