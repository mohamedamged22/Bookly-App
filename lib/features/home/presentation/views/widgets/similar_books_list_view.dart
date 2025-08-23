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
            child: const CustomBookImageItem(
              imageUrl: 'https://www.google.com/imgres?q=book&imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-photo%2Fbook-open-pages-close-up-600nw-2562942291.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fbooks&docid=xbm1sMe2eNjOZM&tbnid=VZZmzZ87LpeD9M&vet=12ahUKEwik5bXliKGPAxWr_7sIHZa7D3YQM3oECAwQAA..i&w=600&h=400&hcb=2&ved=2ahUKEwik5bXliKGPAxWr_7sIHZa7D3YQM3oECAwQAA',
            ),
          );
        },
      ),
    );
  }
}
