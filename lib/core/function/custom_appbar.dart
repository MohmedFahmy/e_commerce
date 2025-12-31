  import 'package:flutter/material.dart';

import '../app_colors.dart';

AppBar CustomAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      title: Text(title, style: TextStyle(color: AppColors.kWhiteColor)),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhiteColor),
      ),
    );
  }
