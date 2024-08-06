import 'package:flutter/material.dart';
import 'package:ticket_app/components/my_button.dart';
import 'package:ticket_app/components/my_textfield.dart';
import 'package:ticket_app/services/auth/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

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
    confirmpasswordController.dispose();
    super.dispose();
  }

  // Register method
  void register() async {
    // Get auth service
    final _authService = AuthService();

    // Check if passwords match -> create user
    if (passwordController.text == confirmpasswordController.text) {
      // Try creating user
      try {
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      } catch (e) {
        // Display any errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // If passwords don't match => show error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated icon
            SlideTransition(
              position: _animation,
              child: Image.asset(
                'lib/images/drinks/b2.png',
                width: 150, // Increase image width
                height: 150, // Increase image height
              ),
            ),

            const SizedBox(height: 25),

            // Message slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
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
            const SizedBox(height: 10),

            // Confirm password textfield
            MyTextfield(
              controller: confirmpasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Sign Up button
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),
            const SizedBox(height: 25),

            // Already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
