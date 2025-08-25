import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'popular_book_state.dart';

class PopularBookCubit extends Cubit<PopularBookState> {
  PopularBookCubit(this.homeRepo) : super(PopularBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchPopularBooks() async {
    emit(PopularBookLoading());
    var result = await homeRepo.fetchPopularBooks();
    result.fold(
      (failur) => emit(PopularBookFailure(failur.errorMessage)),
      (success) => emit(PopularBookSuccess(success)),
    );
  }
}
