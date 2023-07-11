import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> registerUser(String email, String password, String regNumber) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'regNumber': regNumber,
    });
    // Proceed with any necessary actions, such as navigating to the dashboard
    // For example:
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
  } catch (e) {
    print('Registration error: $e');
  }
}
bool validateRegistrationNumber(String regNumber) {
  // Check if the registration number matches the specified format
  RegExp regExp = RegExp(r'^\d{2}/EG/(CO|EE|CV|CE|PE|ME|FE|AG)/\d{4}$');
  if (!regExp.hasMatch(regNumber)) {
    return false;
  }

  // Additional validations
  String departmentCode = regNumber.split('/')[2];
  List<String> validDepartments = ['CO', 'EE', 'CV', 'CE', 'PE', 'ME', 'FE', 'AG'];
  if (!validDepartments.contains(departmentCode)) {
    return false;
  }

  return true;
}
