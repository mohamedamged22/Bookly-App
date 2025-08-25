import 'package:flutter/material.dart';

class CoustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSearch;

  const CoustomTextField({super.key, required this.controller, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSearch, // لما يضغط Enter
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {
            if (onSearch != null) {
              onSearch!(controller.text); // لما يضغط على زر البحث
            }
          },
          icon: const Opacity(opacity: .8, child: Icon(Icons.search, size: 22)),
        ),
      ),
    );
  }
}
