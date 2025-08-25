import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/features/home/data/book_model/book_model.dart';
import 'package:booklyapp/features/search/data/repo/search_repo.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplemention implements SearchRepo {
  SearchRepoImplemention(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String query,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query&projection=full',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(SereverFailure.fromDioError(e));
      }
      return left(SereverFailure(e.toString()));
    }
  }
  

  
  
  }

