import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/book_model/book_model.dart';
import 'package:booklyapp/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

    Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchFailure(failure.errorMessage));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }

}
