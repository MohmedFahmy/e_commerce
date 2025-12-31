  import 'package:flutter/material.dart';

import '../app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> CustomErrorMessage(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              text,
              style: TextStyle(color: AppColors.kWhiteColor),
            ),
            backgroundColor: AppColors.kPrimaryColor,
          ),
        );
  }