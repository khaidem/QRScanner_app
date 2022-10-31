import 'package:flutter_easyloading/flutter_easyloading.dart';

void showHUD({required String title}) {
  EasyLoading.show(status: title, maskType: EasyLoadingMaskType.black);
}

void showSuccess({required String title}) {
  EasyLoading.showSuccess(title);
}

void showErrorHUD({required String title}) {
  EasyLoading.showError(title, duration: const Duration(seconds: 5));
}
