import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            label: Icon(Icons.search, color: AppColors.kPrimaryColor, size: 25),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
