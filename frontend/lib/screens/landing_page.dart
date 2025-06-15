import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void _navigate(BuildContext context, String category) {
    Navigator.pushNamed(
      context,
      '/loginChoice',
      arguments: {'category': category}, // ✅ fixed here
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyRefrence')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your category:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _navigate(context, 'Institution'),
                  child: const Text('Institution'),
                ),
                ElevatedButton(
                  onPressed: () => _navigate(context, 'Industry'),
                  child: const Text('Industry'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
