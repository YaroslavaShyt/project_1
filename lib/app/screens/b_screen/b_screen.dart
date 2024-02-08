import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';

class BScreen extends StatefulWidget {
  const BScreen({super.key});

  @override
  State<BScreen> createState() => _BScreenState();
}

class _BScreenState extends State<BScreen> {
  final TextEditingController _controllerTextField = TextEditingController();
  final TextEditingController _controllerTextFormField =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: _controllerTextField,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: _controllerTextFormField,
        ),
        Button(onLoginButtonPressed: () => {}, title: 'Back')
      ]),
    );
  }
}
