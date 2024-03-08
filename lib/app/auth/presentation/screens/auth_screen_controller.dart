import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class AuthScreenController extends StatelessWidget {
  const AuthScreenController({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) => StreamBuilder<User?>(
        stream: authBloc.authStatusStream,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return sl<SharedPreferences>().getBool(onboardSeenKey) != true
                ? const OnboardScreen()
                : user != null
                    ? const HomeScreen()
                    : const LoginScreen();
          } else {
            return const AuthLoadingScreen();
          }
        },
      ),
    );
  }
}
