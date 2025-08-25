part of 'popular_book_cubit.dart';

sealed class PopularBookState extends Equatable {
  const PopularBookState();

  @override
  List<Object> get props => [];
}

final class PopularBookInitial extends PopularBookState {}

final class PopularBookLoading extends PopularBookState {}

final class PopularBookSuccess extends PopularBookState {
  final List<BookModel> books;
 const PopularBookSuccess(this.books);
}

final class PopularBookFailure extends PopularBookState {
  final String errorMessage;
  const PopularBookFailure(this.errorMessage);
}

