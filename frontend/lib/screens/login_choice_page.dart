import 'package:flutter/material.dart';

class LoginChoicePage extends StatelessWidget {
  final String category;

  const LoginChoicePage({super.key, required this.category});

  void _navigateToLogin(BuildContext context, String role) {
    Navigator.pushNamed(
      context,
      '/login',
      arguments: {
        'category': category,
        'role': role,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> roles = [];

    if (category == 'Institution') {
      roles = ['Admission Cell', 'Alumni', 'Applicant'];
    } else if (category == 'Industry') {
      roles = ['HR', 'Employee', 'Seeker'];
    }

    return Scaffold(
      appBar: AppBar(title: Text('$category Login Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: roles
              .map(
                (role) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    onPressed: () => _navigateToLogin(context, role),
                    child: Text(role),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
