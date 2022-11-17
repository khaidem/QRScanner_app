import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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

  FocusNode textSecondFocusNode = FocusNode();
  @override
  void initState() {
    _updateAppbar();
    super.initState();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            KImage.sangLogo,
            height: 180,
          ),
          FittedBox(
            child: Row(
              children: const [
                GradientText(
                  'Sangai E-Ticket Checker',
                  style: TextStyle(fontSize: 40),
                  gradient: LinearGradient(colors: [
                    Color(0xfff45b69),
                    Color(0xffffbc11),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: userName,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus(textSecondFocusNode);
            },
            decoration: InputDecoration(
              hintText: 'User name',
              labelText: 'User name',
              labelStyle: const TextStyle(color: Colors.black),
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
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
                borderSide: BorderSide(color: Colors.grey),
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
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            focusNode: textSecondFocusNode,
            controller: password,
            obscureText: _isObscure,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              prefixIcon: IconButton(
                  color: Colors.grey,
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
                  color: Colors.grey,
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
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () async {
              if (!formKey.currentState!.validate()) {
                return;
              }
              formKey.currentState!.save();
              if (mounted) {}
              setState(() {
                _isLoading = true;
              });

              await context.read<AuthService>().login(
                    userName.text.trim(),
                    password.text.trim(),
                  );

              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            child: Container(
              width: 500,
              height: 50,
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
              child: _isLoading
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sending please wait',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
    );
  }
}
