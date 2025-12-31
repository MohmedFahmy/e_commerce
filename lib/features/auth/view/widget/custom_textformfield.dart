import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class CostumTextFormField extends StatelessWidget {
  const CostumTextFormField({
    super.key,
    required this.lableText,
    this.sufIcon,
    required this.isScured,
    this.controller,
  });
  final String lableText;
  final Widget? sufIcon;
  final bool isScured;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isScured,
      obscuringCharacter: '*',
      validator: (value) => value!.isEmpty ? 'Please Enter email' : null,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: lableText,
        suffixIcon: sufIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kBordersideColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
