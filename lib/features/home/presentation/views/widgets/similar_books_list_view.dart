import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/widgets.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: const CustomBookImageItem(),
          );
        },
      ),
    );
  }
}
