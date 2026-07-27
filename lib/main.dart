import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/view/screen/login_screen.dart';
import 'package:ecommerce_app/features/nav_bar/view/screen/main_hom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hearreniancdwwyhlnca.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhlYXJyZW5pYW5jZHd3eWhsbmNhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjcyMTc2NzMsImV4cCI6MjA4Mjc5MzY3M30.i6iueU2bqdKnpEBUJGzzZs4zMpS8pM23kRlmUfWCdAw',
  );
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (context) => AuthCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:
            client.auth.currentUser != null
                ? MainHomNavbar()
                : const LoginScreen(),
      ),
    );
  }
}
