// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paytrybe_assessment/app/modules/authentication/models/country_models.dart';
import 'package:paytrybe_assessment/app/shared/widgets/text/base_text.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';

import '../../../../core/config/navigation.dart';
import '../../../shared/widgets/input/custom_textfield.dart';

Future<void> countryBottomSheet(
  BuildContext context, {
  required final Function(CountryModels) callBack,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    builder: (context) => CountryBottomSheet(callBack: callBack),
  );
}

class CountryBottomSheet extends ConsumerStatefulWidget {
  final Function(CountryModels) callBack;
  const CountryBottomSheet({
    super.key,
    required this.callBack,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountryBottomSheetState();
}

class _CountryBottomSheetState extends ConsumerState<CountryBottomSheet> {
  List<CountryModels> search(String query, List<CountryModels> data) {
    final searched = data.where((d) {
      final k = d.country.toLowerCase();
      final i = query.toLowerCase();
      return k.contains(i);
    }).toList();
    return searched;
  }

  int _isSelected = 0;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final phoneSize = MediaQuery.of(context).size;

    return Material(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Container(
        height: phoneSize.height * 0.55,
        padding: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        width: double.maxFinite,
        child: ListView(
          children: [
            const BaseText(
              text: 'Select your country',
              alignText: TextAlign.center,
              weight: FontWeight.w500,
              size: 20,
            ),
            SearchCountryTextField(
              onChanged: (v) {
                setState(() {
                  searchQuery = v;
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                search(searchQuery, countries).length,
                (int index) {
                  final _countries = search(searchQuery, countries);
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pop(context);
                          _isSelected = index;
                          widget.callBack(_countries[_isSelected]);
                        });
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              height: 40,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(_countries[index].svgPath),
                                  const XBox(10),
                                  BaseText(
                                    text: _countries[index].country,
                                    size: 16,
                                    weight: FontWeight.w500,
                                  ),
                                  const Spacer(),
                                  BaseText(
                                    text: _countries[index].countryCode,
                                    size: 16,
                                    weight: FontWeight.w500,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
