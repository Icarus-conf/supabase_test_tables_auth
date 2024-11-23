import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(
      {required String email, required String password}) async {
    return await _client.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  Future<AuthResponse> signUpWithEmailPassword(
      {required String email, required String password}) async {
    return await _client.auth.signUp(
      password: password,
      email: email,
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final session = _client.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
