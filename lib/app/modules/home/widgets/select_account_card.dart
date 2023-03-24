import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';

class SelectAccountType extends HookConsumerWidget {
  const SelectAccountType({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryFlag = useState('assets/svg/canada.svg');

    return Container(
      width: 139,
      height: 34,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.45),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            countryFlag.value,
          ),
          const BaseText(
            text: 'CAD Dollar',
            size: 14,
            color: Color(0xFFF7F9FD),
          ),
          SvgPicture.asset('assets/svg/alt_arrow_down.svg'),
        ],
      ),
    );
  }
}
