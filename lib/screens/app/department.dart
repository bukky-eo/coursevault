import 'package:flutter/material.dart';

class Department extends StatelessWidget {
  final String selectedDepartment;
  const Department({Key? key, required this.selectedDepartment})
      : super(key: key);

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
            body: Column(
              children: [],
            ),
          ),
        ));
  }
}
