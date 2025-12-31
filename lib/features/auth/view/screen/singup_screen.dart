import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/function/error_message.dart';
import '../widget/custom_elevation_buttom.dart';
import '../widget/custom_text_buttom.dart';
import '../widget/custom_textformfield.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SingupSuccess || state is GoogleSignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
        if (state is SingupError) {
          CustomErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body:
              state is SingupLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Welcom To Our Market',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
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
                                      controller: _nameController,
                                      lableText: 'Name',
                                      isScured: false,
                                    ),
                                    SizedBox(height: 15),
                                    CostumTextFormField(
                                      controller: _emailController,
                                      lableText: 'Email',
                                      isScured: false,
                                    ),
                                    SizedBox(height: 30),
                                    CostumTextFormField(
                                      controller: _passwordController,
                                      lableText: 'Password',
                                      sufIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isShow = !isShow;
                                          });
                                        },
                                        icon: Icon(
                                          isShow
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                      isScured: isShow,
                                    ),
                                    SizedBox(height: 10),

                                    SizedBox(height: 24),
                                    CustomElevationButtom(
                                      text: 'Sign up',
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          context.read<AuthCubit>().register(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    CustomElevationButtom(
                                      text: 'Sing Up With Google',
                                      onTap: () {
                                        context
                                            .read<AuthCubit>()
                                            .googleSignIn();
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        CustomTextButtom(
                                          text: 'Login',
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) => LoginScreen(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
