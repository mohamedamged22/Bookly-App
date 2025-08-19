import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 20),
          const Spacer(flex: 1),
          const CustomIcon(icon: Icon(Icons.search, size: 32)),
        ],
      ),
    );
  }
}
