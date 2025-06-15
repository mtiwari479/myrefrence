import 'package:flutter/material.dart';

class ApplicantDashboard extends StatelessWidget {
  const ApplicantDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Applicant Dashboard")),
      body: const Center(child: Text("Welcome Applicant!")),
    );
  }
}
