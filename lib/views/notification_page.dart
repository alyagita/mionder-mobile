import 'package:flutter/material.dart';

class notificationPage extends StatelessWidget {
  const notificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFBFBFB),
        title: const Text("Notifications"),
      ),
    );
  }
}