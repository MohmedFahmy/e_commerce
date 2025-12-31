import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class CustomRowButtom extends StatelessWidget {
  const CustomRowButtom({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final Function()? onTap;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: AppColors.kWhiteColor),
              Text(
                text!,
                style: TextStyle(
                  color: AppColors.kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.kWhiteColor),
            ],
          ),
        ),
      ),
    );
  }
}