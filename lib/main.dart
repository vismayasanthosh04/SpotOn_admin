import 'package:flutter/material.dart';
import 'package:spoton_admin/loginpage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://supabase.com/dashboard/project/fpnaewbduxpslewepdgu',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZwbmFld2JkdXhwc2xld2VwZGd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4NTc0OTAsImV4cCI6MjA0ODQzMzQ5MH0.7QRBq7lvaPJVkxdYaYBNU80t6yAtiEduf7h4X8hPkI',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const LoginScreen(),
    );
  }
}
