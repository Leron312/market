import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sochial/features/auth/data/firebase_auth_repository.dart';
import 'package:sochial/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:sochial/features/auth/presentation/cubits/auth_states.dart';

import 'features/auth/presentation/page/auth_page.dart';
import 'features/post/presentation/page/home_page.dart';
import 'features/themes/light_mode.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authRepository = FirebaseAuthRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepository: authRepository)..checkAuth(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightMode,
          home: BlocConsumer<AuthCubit, AuthStates>(
            builder: (context, authState) {
              if (authState is Unauthenticated) {
                return const AuthPage();
              }
              if(authState is Authenticated){
                return const HomePage();
              }else{
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
            listener: (context, state) {
              if(state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
          )),
    );
  }
}
