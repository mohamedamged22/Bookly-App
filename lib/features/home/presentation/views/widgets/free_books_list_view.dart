import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indecator.dart';
import 'package:booklyapp/features/home/presentation/manger/free_book_cubit/free_book_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeBooksListView extends StatelessWidget {
  const FreeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreeBookCubit, FreeBookState>(
      builder: (context, state) {
        if (state is FreeBookSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return CustomListViewItem(bookModel: state.books[index]);
            },
          );
        } else if (state is FreeBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
