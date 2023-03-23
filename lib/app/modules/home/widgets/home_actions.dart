import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

import '../data/home_actions_data.dart';
import '../models/home_actions_model.dart';

class HomeActions extends ConsumerWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 284,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 25, right: 25),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseText(
            text: 'Getting Started',
            color: const Color(0xFF011A32).withOpacity(.68),
          ),
          const YBox(20),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                return HomeActionsTile(
                  model: homeActions[index],
                );
              },
              separatorBuilder: (_, index) => const Divider(),
              itemCount: homeActions.length,
            ),
          )
        ],
      ),
    );
  }
}

class HomeActionsTile extends StatelessWidget {
  final HomeActionsModel model;
  const HomeActionsTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.maxFinite,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/svg/${model.svgPath}.svg'),
          const XBox(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  text: model.label,
                  size: 14,
                  weight: FontWeight.w500,
                  color: AppColors.darkPrimary,
                ),
                const YBox(7),
                BaseText(
                  text: model.description,
                  size: 12,
                  weight: FontWeight.w500,
                  color: const Color(0xFF023564).withOpacity(.70),
                ),
              ],
            ),
          ),
          const XBox(30),
          CircleAvatar(
            backgroundColor:
                model.isValid ? Colors.green : const Color(0xFFD9D9D9),
            radius: 7,
            child: const Icon(
              Icons.check,
              size: 8,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
