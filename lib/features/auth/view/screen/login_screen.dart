import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/view/screen/forget_pass_screen.dart';
import 'package:ecommerce_app/features/auth/view/screen/singup_screen.dart';
import 'package:ecommerce_app/features/nav_bar/view/screen/main_hom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/function/error_message.dart';
import '../widget/custom_elevation_buttom.dart';
import '../widget/custom_text_buttom.dart';
import '../widget/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainHomNavbar()),
          );
        }
        if (state is LoginError) {
          CustomErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = context.read<AuthCubit>();
        return Scaffold(
          body:
              state is LoginLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                    child: SingleChildScrollView(
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
                                    controller: emailController,
                                    lableText: 'Email',
                                    isScured: false,
                                  ),
                                  SizedBox(height: 30),
                                  CostumTextFormField(
                                    controller: passwordController,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CustomTextButtom(
                                        text: 'Forget Password?',
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      ForgetPassScreen(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  CustomElevationButtom(
                                    text: 'Login',
                                    onTap: () {
                                      cubit.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  CustomElevationButtom(
                                    text: 'Login With Google',
                                    onTap: () {
                                      cubit.googleSignIn();
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dont have an account?',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      CustomTextButtom(
                                        text: 'Sign Up',
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => SingUpScreen(),
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
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
