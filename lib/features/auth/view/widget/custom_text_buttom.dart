import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(color: AppColors.kPrimaryColor, fontSize: 16),
      ),
    );
  }
}