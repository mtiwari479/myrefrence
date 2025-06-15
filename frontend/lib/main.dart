import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/landing_page.dart';
import 'screens/login_choice_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

import 'screens/dashboards/hr_dashboard.dart'; // Importing HR dashboard
import 'screens/dashboards/employee_dashboard.dart';
import 'screens/dashboards/seeker_dashboard.dart';
import 'screens/dashboards/admission_cell_dashboard.dart';
import 'screens/dashboards/alumni_dashboard.dart';
import 'screens/dashboards/applicant_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyRefrenceApp());
}

class MyRefrenceApp extends StatelessWidget {
  const MyRefrenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyRefrence',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LandingPage(),
        '/hrDashboard': (context) => const HrDashboard(),
        '/employeeDashboard': (context) => const EmployeeDashboard(),
        '/seekerDashboard': (context) => const SeekerDashboard(),
        '/admissionDashboard': (context) => const AdmissionDashboard(),
        '/alumniDashboard': (context) => const AlumniDashboard(),
        '/applicantDashboard': (context) => const ApplicantDashboard(),
      },
      onGenerateRoute: (settings) {
        final args = settings.arguments as Map<String, String>?;

        switch (settings.name) {
          case '/loginChoice':
            if (args?['category'] != null) {
              return MaterialPageRoute(
                builder: (_) => LoginChoicePage(category: args!['category']!),
              );
            }
            break;
          case '/login':
            return MaterialPageRoute(
              builder: (_) => const LoginPage(),
              settings: settings,
            );
          case '/signup':
            return MaterialPageRoute(
              builder: (_) => const SignupPage(),
              settings: settings,
            );
        }
        return null;
      },
    );
  }
}
