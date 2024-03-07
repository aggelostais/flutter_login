import 'package:flutter/material.dart';

// Simple view that displays a loading indicator rendered right when the app is launched.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});


  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}