import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/function/custom_appbar.dart';

class NameEditScreen extends StatelessWidget {
  const NameEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Edit Name'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Your Name',

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kBordersideColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
              ),
              onPressed: () {},
              child: Text(
                'Update',
                style: TextStyle(color: AppColors.kWhiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
