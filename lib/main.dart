import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/services/auth/auth/auth_gate.dart';
import 'package:ticket_app/services/auth/auth/login_or_register.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';
import 'package:ticket_app/firebase_options.dart';
import 'package:ticket_app/models/restaurant.dart';
import 'package:ticket_app/screens/login_page.dart';
import 'package:ticket_app/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

   runApp(

     MultiProvider(providers: [
       //theme provider
       ChangeNotifierProvider(create: (context) =>
       ThemeProvider()),

       //restaurant provider
       ChangeNotifierProvider(create: (context) =>
           Restaurant()),

     ],
     child: const MyApp(),),
   );
   
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: const AuthGate(),

      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
