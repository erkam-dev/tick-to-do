import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/app/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("${authBloc.profile?.photoUrl}"),
                onBackgroundImageError: (exception, stackTrace) {},
              ),
              const SizedBox(height: 16),
              Text(
                authBloc.profile?.name ?? 'User',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                authBloc.profile?.email ?? 'Email',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => authBloc.add(const AuthEvent.signOut()),
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}