import 'package:flutter/material.dart';


class HrDashboard extends StatelessWidget {
  const HrDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HR Dashboard")),
      body: const Center(child: Text("Welcome HR!")),
    );
  }
}
