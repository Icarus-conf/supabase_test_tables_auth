import 'package:flutter/material.dart';
import 'package:notes_supabase/auth_view.dart';
import 'package:notes_supabase/notes_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://jolgnbgjutnphtfzcpry.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpvbGduYmdqdXRucGh0ZnpjcHJ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIzOTAwMDcsImV4cCI6MjA0Nzk2NjAwN30.Ai_ox24bmw8Olp_loCvnp46DORWpclKglrSMuG1khO8",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthView(),
    );
  }
}
