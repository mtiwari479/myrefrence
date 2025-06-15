import 'package:flutter/material.dart';

class AdmissionDashboard extends StatelessWidget {
  const AdmissionDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admission Cell Dashboard"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Welcome Admission Cell!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
