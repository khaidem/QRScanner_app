import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_scan_app/__example_module/core/extension/theme.extension.dart';
import 'package:qr_scan_app/onbaording/core/type/field_name.type.dart';
import 'package:qr_scan_app/router/app_router.gr.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/constant/constant.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, form, child) {
        return ListView(
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
              padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
              child: ReactiveTextField(
                formControlName: FiledName.userName,
                decoration:
                    getInputDecoration(context: context, hintText: 'UserName'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 35, 0),
              child: ReactiveTextField(
                formControlName: FiledName.password,
                decoration:
                    getInputDecoration(context: context, hintText: 'Password'),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
              child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const QrScannerRoute());
                  },
                  child: const Text('Submit')),
            )
          ],
        );
      },
    );
  }

  get form => FormGroup({
        FiledName.userName: FormControl<String>(
          validators: [],
          touched: true,
        ),
        FiledName.password: FormControl<String>(validators: [])
      });
  InputDecoration getInputDecoration({
    required BuildContext context,
    required String hintText,
  }) {
    return InputDecoration(
      filled: true,
      hintText: hintText,
      hintStyle: context.textTheme.titleMedium,
      border: const OutlineInputBorder(),
    );
  }
}
