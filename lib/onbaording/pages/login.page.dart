import 'package:flutter/material.dart';

import '../example.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(35),
      child: Scaffold(
        body: SingleChildScrollView(
          child: LoginFormWidget(),
        ),
      ),
    );
  }
}
