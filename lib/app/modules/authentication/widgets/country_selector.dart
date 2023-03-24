import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/layout.dart';
import 'country_dropdown.dart';
import '../../../shared/widgets/text/base_text.dart';

class CountrySelector extends HookConsumerWidget {
  final ValueChanged<String> countryCode;
  const CountrySelector({
    super.key,
    required this.countryCode,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryFlag = useState('assets/svg/canada.svg');
    final code = useState('+1');

    Future<void> selectCountry() async {
      await countryBottomSheet(
        context,
        callBack: (v) {
          code.value = v.countryCode;
          countryFlag.value = v.svgPath;
          countryCode(code.value);
        },
      );
    }

    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Container(
            width: 54,
            height: 32,
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: const Color(0xFF011B33),
              ),
            ),
            child: InkWell(
              onTap: () {
                selectCountry();
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SvgPicture.asset(
                      countryFlag.value,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svg/arrow_down.svg'),
                ],
              ),
            ),
          ),
          const XBox(20),
          BaseText(
            text: code.value,
            size: 16,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
