import 'package:coursevault/assets/colors.dart';
import 'package:coursevault/assets/navigation.dart';
import 'package:coursevault/assets/text_field.dart';
import 'package:coursevault/screens/app/home_page.dart';
import 'package:flutter/material.dart';

import '../../assets/button.dart';
import '../../models/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _regNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/nuesa_uniuyo.jpg',height: 50, width: 50,),
              const SizedBox(height: 16.0),
              const Text('S I G N U P', style:TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              const SizedBox(height: 36.0),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                label: 'E-mail',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                  onSaved: (value) {
                    _email = value!;
                  },
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                obscure: true,
                label: 'Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                  onSaved: (value) {
                    _password = value!;
                  } ,
              ),
              const SizedBox(height: 16.0),
              CustomTextField(label: 'Registration No.',validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your registration number';
               }

               // Check the format and validate the registration number
               if (!validateRegistrationNumber(value)) {
                 return 'Invalid registration number';
               }

               return null;
             },
                 onSaved: (value) {
                   _regNumber = value!;
                 },),
              const SizedBox(height: 40.0),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Call the login function with the entered email, password, and registration number
                    registerUser(_email, _password, _regNumber);
                    Navigation.push(const HomePage(), context);
                  }
                }, text: 'Sign Up', context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
