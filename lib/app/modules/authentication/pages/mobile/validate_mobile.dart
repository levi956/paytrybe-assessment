import 'package:flutter/material.dart';
import 'package:paytrybe_assessment/app/modules/authentication/pages/sign_up/sign_up.dart';
import 'package:paytrybe_assessment/app/shared/widgets/buttons/custom_button.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/config/navigation.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

import '../../../../../core/constants/layout.dart';
import '../../../../shared/widgets/appbar/custom_appbar.dart';
import '../../../../shared/widgets/input/pin_code_textfield.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({
    super.key,
    required this.onOtpChanged,
    required this.onVerify,
    required this.phone,
  });
  final Function(String) onOtpChanged;
  final VoidCallback onVerify;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Account',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YBox(30),
              const BaseText(
                text: 'Verify Phone number',
                size: 24,
                weight: FontWeight.w500,
              ),
              const YBox(50),
              BaseText(text: 'Enter the 6 digit otp code sent to $phone'),
              const YBox(10),
              CustomPinCodeField(
                length: 6,
                onChanged: (otp) {
                  onOtpChanged(otp);
                },
              ),
              const YBox(20),
              Center(
                child: _resendButton(
                  () {},
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  const page = SignUpPage();
                  pushTo(context, page);
                },
              ),
              const YBox(50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _resendButton(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 92,
      height: 28,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.darkPrimary,
          ),
          borderRadius: BorderRadius.circular(40)),
      child: const Center(
        child: BaseText(
          text: 'Resend code',
          size: 13,
        ),
      ),
    ),
  );
}
