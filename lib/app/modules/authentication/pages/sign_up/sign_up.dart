// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/shared/helpers/eye_visibility.dart';
import 'package:paytrybe_assessment/app/shared/pages/dashboard.dart';
import 'package:paytrybe_assessment/app/shared/widgets/buttons/custom_button.dart';
import 'package:paytrybe_assessment/app/shared/widgets/input/custom_textfield.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/bar_color.dart';

import '../../../../../core/config/navigation.dart';
import '../../../../shared/widgets/appbar/custom_appbar.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setStatusBarColor(color: BarColor.black);

    final name = useState('');
    final email = useState('');
    final password = useState('');

    final showPassword = useState(false);

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Account',
        ),
        body: Padding(
          padding: appPadding,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YBox(60),
                const BaseText(
                  text: 'Email & Password',
                  size: 24,
                  weight: FontWeight.w500,
                ),
                const YBox(7),
                const BaseText(
                  text: 'Enter your First & last name as seen in you ID',
                  size: 14,
                  weight: FontWeight.w500,
                ),
                const YBox(40),
                CustomTextField(
                  label: '',
                  hintText: 'First & last name',
                  keyboardType: TextInputType.name,
                  onChanged: (v) {
                    name.value = v;
                  },
                ),
                CustomTextField(
                  label: '',
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (v) {
                    email.value = v;
                  },
                ),
                CustomTextField(
                  label: '',
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  isHidden: !showPassword.value,
                  onChanged: (v) {
                    password.value = v;
                  },
                  suffix: EyeVisibility(show: showPassword),
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
                    const page = DashboardPage();
                    pushTo(context, page);
                  },
                ),
                const YBox(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
