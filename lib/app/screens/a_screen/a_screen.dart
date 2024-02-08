import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';

class AScreen extends StatelessWidget {
  const AScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Button(
        title: 'Back',
        onLoginButtonPressed: () => {},
      )),
    );
  }
}
