import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InsecureEnvironmentPage extends StatelessWidget {
  const InsecureEnvironmentPage({super.key});

  void _exitApp() {
    try {
      SystemNavigator.pop();
    } catch (_) {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.security, size: 80, color: Colors.red),
                const SizedBox(height: 20),
                const Text(
                  "Device is insecure",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  "This device appears to be rooted or jailbroken. "
                  "For security reasons, the app cannot run.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _exitApp,
                  child: const Text("Exit App"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
