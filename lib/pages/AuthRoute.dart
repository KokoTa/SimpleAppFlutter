import 'package:flutter/material.dart';

class AuthRoute extends StatelessWidget {
  const AuthRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth Route"),
      ),
      body: Center(
        child: Column(
          children: const [Text("Auth Route")],
        ),
      ),
    );
  }
}
