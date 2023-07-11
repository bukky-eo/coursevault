import 'package:coursevault/assets/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app/home_page.dart';
import 'app/sign_up.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAuthentication();
    });
  }

  Future<void> checkUserAuthentication() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // User is authenticated. Redirect to homepage.
      Navigation.push(const HomePage(), context);
    } else {
      // User is not authenticated. Redirect to signup page.
      Navigation.push(const SignUp(), context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('C O U R S E V A U L T', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
            CircularProgressIndicator(),
          ],
        ),
        // Display a loading indicator
      ),
    );
  }
}