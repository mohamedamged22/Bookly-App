import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(height: 50),
          Text('Best Seller', style: Style.titleMedium),
        ],
      ),
    );
  }
}
