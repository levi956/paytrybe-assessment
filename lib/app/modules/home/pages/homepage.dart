import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/modules/home/widgets/home_actions.dart';
import 'package:paytrybe_assessment/app/modules/home/widgets/quick_actions_card.dart';
import 'package:paytrybe_assessment/app/modules/home/widgets/select_account_card.dart';
import 'package:paytrybe_assessment/app/shared/widgets/buttons/custom_button.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              height: 332,
              color: const Color(0xFF3269FC),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 20,
                right: 20,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/svg/paytrybe_tag.svg'),
                        const Spacer(),
                        SvgPicture.asset('assets/svg/notification_bell.svg'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 110, left: 20, right: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: '\$',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white.withOpacity(.68),
                          ),
                          children: [
                            TextSpan(
                              text: ' 100',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            const TextSpan(
                              text: '.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const YBox(30),
                    const SelectAccountType(),
                    const YBox(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonOutlined(
                            text: 'Add Money',
                            borderSideColor: Colors.white,
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        const XBox(20),
                        Expanded(
                          child: CustomButton(
                            text: 'Send Money',
                            buttonHeight: 41,
                            buttonTextColor: AppColors.primaryColor,
                            buttonColor: Colors.white,
                            fontSize: 14,
                            buttonRadius: 6,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const YBox(30),
                    const QuickActionsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
        const YBox(30),
        const HomeActions(),
      ],
    );
  }
}
