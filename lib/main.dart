import 'package:flutter/material.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/mobile/input_mobile.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

void main() {
  runApp(const PaytrybeApp());
}

class PaytrybeApp extends StatelessWidget {
  const PaytrybeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paytrybe',
      theme: AppTheme.lightThemeData,
      home: const InputMobilePage(),
    );
  }
}
