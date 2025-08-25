import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/free_books_list_view.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/puplar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا ممكن تحدد ارتفاع الـ TabBarView حسب احتياجك
    final double tabViewHeight = MediaQuery.of(context).size.height*.55;

    return DefaultTabController(
      length: 3,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10,
                  ),
                  child: CustomAppBar(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kShearchView);
                    },
                  ),
                ),
                const FeaturedListView(),
                const SizedBox(height: 20),
                // TabBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    labelStyle: Styles.textStyle18,
                    tabs: const [
                      Tab(text: 'Language'),
                      Tab(text: 'Programming'),
                      Tab(text: 'Science'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // هنا بنعمل SizedBox للـ TabBarView
          SliverToBoxAdapter(
            child: SizedBox(
              height: tabViewHeight, // ارتفاع الـ TabBarView اللي انت عايزه
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: NewestListView(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: FreeBooksListView(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: PopularListView(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
