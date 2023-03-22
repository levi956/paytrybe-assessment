import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/shared/widgets/buttons/custom_button.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';
import 'package:paytrybe_assessment/core/theme/bar_color.dart';

class InputMobilePage extends HookConsumerWidget {
  const InputMobilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      body: Padding(
        padding: appPadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YBox(60),
              const BaseText(
                text: 'Get Started',
                size: 24,
                weight: FontWeight.w500,
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {},
              ),
              const YBox(30),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const BaseText(
                      text: 'Have an account? ',
                      size: 16,
                    ),
                    GestureDetector(
                      child: const BaseText(
                        text: 'Sign in',
                        size: 16,
                        decoration: TextDecoration.underline,
                        weight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const YBox(20),
            ],
          ),
        ),
      ),
    );
  }
}
