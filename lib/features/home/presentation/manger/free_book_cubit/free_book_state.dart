part of 'free_book_cubit.dart';

sealed class FreeBookState extends Equatable {
  const FreeBookState();

  @override
  List<Object> get props => [];
}

final class FreeBookInitial extends FreeBookState {}

final class FreeBookLoading extends FreeBookState {}

final class FreeBookSuccess extends FreeBookState {
  final List<BookModel> books;
  const FreeBookSuccess(this.books);
}

final class FreeBookFailure extends FreeBookState {
  final String errorMessage;
  const FreeBookFailure(this.errorMessage);
}
