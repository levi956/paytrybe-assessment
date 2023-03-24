import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/mobile/input_mobile.dart';
import 'package:paytrybe_assessment/core/setups/setups.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

void main() async {
  await Setups.init();
  runApp(const ProviderScope(
    child: PaytrybeApp(),
  ));
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
