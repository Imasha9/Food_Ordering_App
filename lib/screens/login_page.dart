import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/components/my_button.dart';
import 'package:ticket_app/components/my_textfield.dart';
import 'package:ticket_app/services/auth/auth/auth_service.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Animation controller
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Faster animation
    )..repeat(reverse: true);

    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.2)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Login method
  void login() async {
    // Get instance of auth service
    final authService = AuthService();

    // Try sign in
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('You don\'t have an account. Please register first.'),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.message!),
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, // Change background color here
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated burger icon
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'lib/images/drinks/b2.png',
                  width: 150, // Increase image width
                  height: 150, // Increase image height
                ),
              ),

              const SizedBox(height: 50),

              // Message app slogan
              Text(
                "F O O D F L E E T",
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold, // Makes the text bold
                   // Makes the text italic
                ),
              ),

              const SizedBox(height: 25),

              // Email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 10),

              // Password textfield
              MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // Sign in button
              MyButton(text: "Sign In", onTap: login),
              const SizedBox(height: 25),

              // Not a member? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
