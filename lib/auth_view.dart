import 'package:flutter/material.dart';
import 'package:notes_supabase/login_view.dart';
import 'package:notes_supabase/profile_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final session = snapshot.hasData ? snapshot.data!.session : null;

          if (session != null) {
            return const ProfileView();
          } else {
            return const LoginView();
          }
        });
  }
}
