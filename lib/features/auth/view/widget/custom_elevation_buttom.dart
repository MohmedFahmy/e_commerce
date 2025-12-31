import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevationButtom extends StatelessWidget {
  const CustomElevationButtom({
    super.key,
    this.onTap,
    required this.text,
    this.icon = null,
  });
  final Function()? onTap;
  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kScaffoldColor,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onTap,
      icon: icon,
      label: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}