import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 45),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 20),
          const Spacer(flex: 1),
          CustomIcon(icon: Icon(Icons.search, size: 32)),
        ],
      ),
    );
  }
}
