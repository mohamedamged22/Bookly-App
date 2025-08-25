import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'free_book_state.dart';

class FreeBookCubit extends Cubit<FreeBookState> {
  FreeBookCubit(this.homeRepo) : super(FreeBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFreeBooks() async {
    emit(FreeBookLoading());
    var result = await homeRepo.fetchFreeBooks();
    result.fold(
      (failur) => emit(FreeBookFailure(failur.errorMessage)),
      (success) => emit(FreeBookSuccess(success)),
    );
  }
}
