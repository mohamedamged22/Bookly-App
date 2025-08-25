import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indecator.dart';
import 'package:booklyapp/features/home/presentation/manger/popular_book_cubit/popular_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBookCubit, PopularBookState>(
      builder: (context, state) {
        if (state is PopularBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,

            padding: const EdgeInsets.only(bottom: 20),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return CustomListViewItem(bookModel: state.books[index]);
            },
          );
        } else if (state is PopularBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
