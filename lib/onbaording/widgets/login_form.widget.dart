import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_app/QRScan/pages/qr_scanner.page.dart';
import 'package:qr_scan_app/core/helper/logger.dart';
import 'package:qr_scan_app/onbaording/logic/auth_service.dart';

import '../../core/constant/constant.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool _isObscure = true;
  bool _isLoading = false;
  final bool _isEnable = false;

  FocusNode textSecondFocusNode = FocusNode();

  /// ### For Error Dialog Show when Username or Password wrong
  ///
  _showDialog(context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Center(
          child: SizedBox(
              height: 50, child: Image.asset('assets/images/errorIcon.png')),
        ),
        content: const Text('Username or password wrong'),
        actions: [
          ElevatedButton(
            child: const Text('Close me!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 100),
          ClipRRect(
            child: Image.asset(
              KImage.qrScan1,
              height: 150,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            appName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: userName,
              onFieldSubmitted: (String value) {
                FocusScope.of(context).requestFocus(textSecondFocusNode);
              },
              decoration: InputDecoration(
                hintText: 'User name',
                labelText: 'User name',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.person),
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black38,
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
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              focusNode: textSecondFocusNode,
              controller: password,
              // obscureText: _isObscure,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: _isObscure
                        ? const Icon(Icons.lock)
                        : const Icon(Icons.visibility)),
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white70,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black38,
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
                  return 'Please Entry password';
                }
                if (value.length < 5) {
                  return 'Password must be at least 6 characters long.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) {
                return;
              }
              formKey.currentState!.save();
              if (mounted) {
                setState(() {
                  _isLoading = true;
                });
              }
              try {
                await context
                    .read<AuthService>()
                    .login(
                      userName.text,
                      password.text,
                    )
                    .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QrScannerPage(),
                        )));
                await Future.delayed(
                  const Duration(seconds: 5),
                );
              } catch (error) {
                logger.i(error);
                _showDialog(context);
              }
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: (_isLoading)
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1.5,
                    ),
                  )
                : const Text('login'),
          )
        ],
      ),
    );
  }
}
