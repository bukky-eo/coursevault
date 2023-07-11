import 'package:coursevault/screens/app/home_page.dart';
import 'package:coursevault/screens/app/sign_up.dart';
import 'package:coursevault/screens/homepage.dart';
import 'package:coursevault/screens/web/web_splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'assets/colors.dart';
import 'assets/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CourseVault());
}

class CourseVault extends StatelessWidget {
  const CourseVault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coursevault',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        dividerColor: CustomColors.black.withOpacity(0.05),
        scaffoldBackgroundColor: CustomColors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(
            color: CustomColors.black,
            size: 20,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: CustomTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: CustomColors.black,
          ),
        ),
      ),
      home: kIsWeb ? const WebSplashScreen() : const SplashScreen(),
    );
  }
}


