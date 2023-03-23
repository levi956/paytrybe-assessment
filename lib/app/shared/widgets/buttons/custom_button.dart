import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

import '../text/base_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final VoidCallback onPressed;
  final Color? buttonTextColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final double? buttonRadius;
  final FontWeight? buttonTextWeight;
  final bool Function()? validator;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonTextColor,
      this.validator,
      this.buttonRadius,
      this.buttonHeight,
      this.buttonTextWeight,
      this.buttonColor,
      this.fontSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 51,
      width: buttonWidth ?? double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonRadius ?? 25),
        color: (validator == null ? true : validator!())
            ? buttonColor ?? AppColors.primaryColor
            : Colors.blueGrey,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 9, bottom: 9),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonRadius ?? 1),
            ),
          ),
        ),
        onPressed: (validator == null ? true : validator!()) ? onPressed : null,
        child: BaseText(
          text: text,
          size: fontSize ?? 16,
          weight: FontWeight.w500,
          color: buttonTextColor ?? Colors.white,
        ),
      ),
    );
  }
}

class CustomButtonOutlined extends ConsumerWidget {
  final String text;
  final Color? textColor;
  final VoidCallback onPressed;
  final double? buttonWidth;
  final Color? borderSideColor;
  const CustomButtonOutlined({
    super.key,
    required this.text,
    this.textColor,
    this.buttonWidth,
    this.borderSideColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 41,
      width: buttonWidth ?? phoneSize.width * 0.65,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          side: BorderSide(
            color: borderSideColor ?? const Color(0xFFFF0033),
            width: 1.4,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: textColor ?? const Color(0xFFFF0033),
          ),
        ),
      ),
    );
  }
}
