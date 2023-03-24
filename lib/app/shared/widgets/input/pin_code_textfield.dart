import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_theme.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.onChanged,
  });

  final int length;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: length,
      appContext: context,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      cursorColor: AppColors.primaryColor,
      cursorHeight: 25,
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (value) {
        HapticFeedback.mediumImpact();
        onChanged?.call(value);
      },
      onCompleted: onCompleted,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      pinTheme: PinTheme(
        fieldOuterPadding: const EdgeInsets.all(7),
        shape: PinCodeFieldShape.box,
        activeColor: const Color(0xFF96A3B1),
        selectedColor: AppColors.darkPrimary,
        inactiveColor: const Color(0xFF96A3B1),
        borderWidth: 1,
        borderRadius: BorderRadius.circular(4),
        activeFillColor: Colors.white,
      ),
    );
  }
}
