import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Get arguments (category & role)
      final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
      final role = args?['role'] ?? '';

      // Navigate based on role
      switch (role.toLowerCase()) {
        case 'hr':
          Navigator.pushReplacementNamed(context, '/hrDashboard');
          break;
        case 'employee':
          Navigator.pushReplacementNamed(context, '/employeeDashboard');
          break;
        case 'seeker':
          Navigator.pushReplacementNamed(context, '/seekerDashboard');
          break;
        case 'admission cell':
          Navigator.pushReplacementNamed(context, '/admissionDashboard');
          break;
        case 'alumni':
          Navigator.pushReplacementNamed(context, '/alumniDashboard');
          break;
        case 'applicant':
          Navigator.pushReplacementNamed(context, '/applicantDashboard');
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unknown role. Cannot navigate.')),
          );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final category = args?['category'] ?? 'Unknown';
    final role = args?['role'] ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(title: Text('Login - $role')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login for $role ($category)', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
