import 'package:flutter/material.dart';
import 'package:qr_scan_app/core/constant/constant.dart';
import 'package:qr_scan_app/onbaording/pages/verification_otp.page.dart';

class OtpLoginPage extends StatelessWidget {
  const OtpLoginPage({Key? key}) : super(key: key);
  static const routeName = '/OtpLoginPage';

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
                        'We will send you OTP on this ',
                        style: getSemiBoldStyle(color: Colors.black),
                      ),
                      Text(
                        'mobile number',
                        style: getSemiBoldStyle(color: Colors.black),
                      )
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
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  labelStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
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
                      .pushNamed(VerificationOtpPage.routeName);
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
                      'Request OTP',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              getSizeBox(200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by',
                    style: getSemiBoldStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20, child: Image.asset(KImage.globizLogo))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
