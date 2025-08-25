import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:booklyapp/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      context.read<SearchCubit>().searchBooks(query: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoustomTextField(controller: _controller, onSearch: _handleSearch),
          const SizedBox(height: 16),
          const Text('Search Result', style: Styles.textStyle18),
          const SizedBox(height: 16),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
