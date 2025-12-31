import 'package:ecommerce_app/core/function/error_message.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';
import '../widget/custom_elevation_buttom.dart';
import '../widget/custom_textformfield.dart';

class ForgetPassScreen extends StatefulWidget {
  ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          Navigator.pop(context);
          CustomErrorMessage(context, 'Email Sent Successfully');
        }
      },
      builder: (context, state) {
        return state is PasswordResetLoading
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Write Your Email To Reset Password',

                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Card(
                        margin: const EdgeInsets.all(16),
                        color: AppColors.kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              CostumTextFormField(
                                controller: _emailController,
                                lableText: 'Email',
                                isScured: false,
                              ),
                              SizedBox(height: 25),
                              CustomElevationButtom(
                                text: 'Send',
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().resetPassword(
                                      _emailController.text,
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
