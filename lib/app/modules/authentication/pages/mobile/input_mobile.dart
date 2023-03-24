// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/mobile/validate_mobile.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/sign_up/sign_up.dart';
import 'package:paytrybe_assessment/app/shared/widgets/buttons/custom_button.dart';
import 'package:paytrybe_assessment/app/shared/widgets/input/custom_textfield.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/config/navigation.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';
import 'package:paytrybe_assessment/core/theme/bar_color.dart';

class InputMobilePage extends HookConsumerWidget {
  const InputMobilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);

    final _phone = useTextEditingController();

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
                const YBox(40),
                AltCustomTextField(
                  label: 'Phone Number',
                  prefixIcon: CountrySelector(
                    countryCode: (v) {},
                  ),
                  controller: _phone,
                ),
                const YBox(40),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'By continuing, you agree to the Paytrype',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' Platform Terms and Conditions, Rewards Policy',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const TextSpan(
                          text: ' and',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: ' Privacy Policy.',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    final page = VerifyAccountPage(
                      onOtpChanged: (otp) {},
                      onVerify: () {},
                    );
                    pushTo(context, page);
                  },
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
      ),
    );
  }
}
