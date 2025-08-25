import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/data/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/book_action.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_reating.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: CustomBookImageItem(
                    imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail,
                  ),
                ),
                const SizedBox(height: 43),
                Text(
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: .7,
                  child: Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                CustomBookReating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                ),
                const SizedBox(height: 37),
                BookAction(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You Can Also Like',
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const SimilarBooksListView(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
