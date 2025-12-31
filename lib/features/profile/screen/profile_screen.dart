import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/model/user_data.dart';
import 'package:ecommerce_app/features/profile/screen/name_edit_screen.dart';
import 'package:ecommerce_app/features/profile/screen/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_colors.dart';
import '../../../core/function/error_message.dart';
import '../../auth/view/screen/login_screen.dart';
import '../widget/custom_row_bottom.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
        if (state is LoginError) {
          CustomErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        UserDataModel? cubit2 = context.read<AuthCubit>().userDataModel;
        return state is SignOutLoading
            ? Center(child: CircularProgressIndicator())
            : Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  color: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.kPrimaryColor,
                          foregroundColor: AppColors.kWhiteColor,
                          child: Icon(Icons.person, size: 50),
                        ),
                        SizedBox(height: 15),
                        Text(
                          cubit2?.name ?? 'User Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          cubit2?.email ?? 'User Email',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 40),
                        CustomRowButtom(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NameEditScreen(),
                              ),
                            );
                          },
                          icon: Icons.person,
                          text: 'Edit Name',
                        ),
                        SizedBox(height: 15),
                        CustomRowButtom(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrdersScreen(),
                              ),
                            );
                          },
                          icon: Icons.shopping_basket,
                          text: 'Your Orders',
                        ),
                        SizedBox(height: 15),
                        CustomRowButtom(
                          onTap: () async {
                            await context.read<AuthCubit>().signOut();
                          },
                          icon: Icons.logout,
                          text: 'Logout',
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
}
