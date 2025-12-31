import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/features/nav_bar/cubit/navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../favorite/screen/favorite_screen.dart';
import '../../../home/view/screen/home_screen.dart';
import '../../../profile/screen/profile_screen.dart';
import '../../../store/view/screen/store_screen.dart';

class MainHomNavbar extends StatelessWidget {
  MainHomNavbar({super.key});
  final List<Widget> _screens = [
    HomeScreen(),
    StoreScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: BlocBuilder<NavbarCubit, NavbarState>(
        builder: (context, state) {
          NavbarCubit cubit =BlocProvider.of<NavbarCubit>(context);
          return Scaffold(
            body: SafeArea(child: _screens[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: GNav(
                  onTabChange: (value) {
                    cubit.changeIndex(value);
                  },
                  rippleColor:
                      AppColors
                          .kPrimaryColor, // tab button ripple color when pressed
                  hoverColor: AppColors.kPrimaryColor, // tab button hover color

                  duration: Duration(
                    milliseconds: 400,
                  ), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: Colors.grey, // unselected icon color
                  activeColor: Colors.white, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      Colors.blue, // selected tab background color
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // navigation bar padding
                  tabs: [
                    GButton(icon: Icons.home, text: 'Home'),
                    GButton(icon: Icons.store, text: 'Store'),
                    GButton(icon: Icons.favorite, text: 'Search'),
                    GButton(icon: Icons.person, text: 'Profile'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
