import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: const CustomBookImageItem(),
          ),
          const SizedBox(height: 43),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipilg',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
