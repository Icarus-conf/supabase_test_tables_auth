import 'package:flutter/material.dart';
import 'package:notes_supabase/auth_service.dart';
import 'package:notes_supabase/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final service = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter valid email  as abc@gmail.com',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter secure password',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 55,
              width: 360,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Log in ',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  service.signInWithEmailPassword(
                      email: emailController.text,
                      password: passwordController.text);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 62),
                  child: Text('Don\'t have account yet? '),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ),
                        );
                      },
                      child: const Text(
                        'SignUp now',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
