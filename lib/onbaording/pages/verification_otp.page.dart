import 'package:flutter/material.dart';
import 'package:qr_scan_app/router/bottom_navigation.router.dart';

import '../../core/constant/constant.dart';

class VerificationOtpPage extends StatelessWidget {
  const VerificationOtpPage({Key? key}) : super(key: key);
  static const routeName = '/VerificationOtpPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSizeBox(50.0),
              Image.asset(
                KImage.sangaiLogo,
                height: 50,
              ),
              getSizeBox(20.0),
              const Text(
                'AGENT',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('Login',
                  style: getExtraStyle(color: const Color(0xfff45b69))),
              getSizeBox(20.0),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter OTP send to your mobile number',
                        style: getSemiBoldStyle(color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              getSizeBox(20),
              TextFormField(
                // controller: userName,
                onFieldSubmitted: (String value) {
                  // FocusScope.of(context).requestFocus(textSecondFocusNode);
                },
                decoration: InputDecoration(
                  hintText: 'OTP',
                  labelText: 'OTP',
                  labelStyle: const TextStyle(color: Colors.black),
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid UserName';
                  }
                  // if (!value.contains('@')) {
                  //   return 'username contains @ required';
                  // }
                  return null;
                },
              ),
              getSizeBox(20),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(BottomNavigationBarRouter.routeName);
                },
                child: Container(
                  width: 500,
                  height: 55,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.0, 0.0],
                      colors: [
                        Color(0xfff45b69),
                        Color(0xffffbc11),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
