import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';

import '../models/quick_actions_model.dart';

class QuickActionsCard extends HookConsumerWidget {
  const QuickActionsCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 132,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuickActionsButton(
            model: QuickActionsModel(
              'request_money',
              'Request\nMoney',
              () {},
            ),
          ),
          QuickActionsButton(
            model: QuickActionsModel(
              'exchange',
              'Exchange\nCurrency',
              () {},
            ),
          ),
          QuickActionsButton(
            model: QuickActionsModel(
              'mobile_phone',
              'Buy\nAirtime',
              () {},
            ),
          ),
        ],
      ),
    );
  }
}

class QuickActionsButton extends StatelessWidget {
  final QuickActionsModel model;
  const QuickActionsButton({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/${model.svgPath}.svg',
        ),
        const YBox(7),
        BaseText(
          text: model.label,
          size: 14,
          alignText: TextAlign.center,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
