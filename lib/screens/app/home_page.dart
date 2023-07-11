
import 'package:coursevault/assets/colors.dart';
import 'package:flutter/material.dart';

import 'department.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDepartment;

  List<String> departments = [
    'Mechanical Engineering',
    'Computer Engineering',
    'Civil Engineering',
    'Electrical Engineering',
    'Chemical Engineering',
    'Petroleum Engineering',
    'Agric Engineering',
    'Food Engineering'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/logo.jpg',
              ),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.6),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'C O U R S E V A U L T',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: CustomColors.primary),
                  ),
                ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Hi Future Engineer, \nYour course is a rewarding study choice that opens doors to innovation and problem-solving. With Course Vault, the ultimate companion, revolutionizes learning by providing a comprehensive repository of course materials and past questions. ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: CustomColors.white),
              textAlign: TextAlign.justify,
            ),),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.orange,
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (selectedDepartment != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Department( selectedDepartment: '',),
                          ),
                        );
                      }
                    },
                    child: DropdownButton(
                      value: selectedDepartment,
                      focusColor: CustomColors.orange,
                      hint: Text('Select department'),
                      onChanged: (newValue) {
                        setState(() {
                          selectedDepartment = newValue!;
                        });
                      },
                      dropdownColor: CustomColors.orange,
                      items: departments.map((department) {
                        return DropdownMenuItem(
                          child: Text(department),
                          value: department,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
