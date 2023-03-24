import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paytrybe_assessment/core/constants/layout.dart';
import 'package:paytrybe_assessment/core/theme/app_theme.dart';

import '../text/base_text.dart';

class AltCustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? isHidden;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? inputValid;
  final String? makeValid;
  final TextStyle? hintStyle;
  final int? maxLength;
  final FloatingLabelBehavior? labelBehavior;
  final Function()? onTap;
  final bool? enabled;

  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;

  const AltCustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.controller,
    this.onTap,
    this.inputValid,
    this.labelBehavior,
    this.keyboardType,
    this.enabled,
    this.maxLength,
    this.isHidden,
    this.hintStyle,
    this.makeValid,
    this.onChanged,
    this.prefixIcon,
    this.readOnly,
    this.inputFormatters,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color grey3 = const Color(0xFFF9FAFB);
    Color borderSide = const Color(0xFF011B33);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: label,
          size: 14,
          weight: FontWeight.w500,
        ),
        const YBox(6),
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              TextField(
                onTap: onTap,
                enabled: enabled,
                maxLength: maxLength,
                controller: controller,
                readOnly: readOnly ?? false,
                autocorrect: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                inputFormatters: inputFormatters,
                obscureText: isHidden ?? false,
                cursorColor: Colors.black,
                keyboardType: keyboardType,
                onChanged: onChanged,
                decoration: InputDecoration(
                  suffixIcon: suffix,
                  prefixIcon: prefixIcon,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(22),
                  floatingLabelBehavior: labelBehavior,
                  fillColor: Theme.of(context).cardColor,
                  filled: true,
                  focusColor: grey3,
                  labelText: hintText ?? '',
                  hintStyle: hintStyle,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: (inputValid ?? true) ? borderSide : Colors.red,
                        width: (inputValid ?? true) ? 1.3 : 1.6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: borderSide, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xFFCCCCCC), width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    gapPadding: 2,
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderSide),
                  ),
                ),
              ),
            ],
          ),
        ),
        const YBox(5),
        (inputValid ?? false)
            ? const SizedBox.shrink()
            : BaseText(
                text: makeValid ?? '',
                size: 12,
                color: Colors.red,
                weight: FontWeight.w600,
              )
      ],
    );
  }
}

final outlineInputBorderBase = UnderlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide.none,
);

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool? isHidden;
  final String? hintText;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? inputValid;
  final String? makeValid;
  final TextStyle? hintStyle;
  final int? maxLength;
  final FloatingLabelBehavior? labelBehavior;
  final Function()? onTap;
  final bool? enabled;

  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.controller,
    this.onTap,
    this.inputValid,
    this.labelBehavior,
    this.keyboardType,
    this.enabled,
    this.maxLength,
    this.isHidden,
    this.hintStyle,
    this.makeValid,
    this.onChanged,
    this.prefixIcon,
    this.readOnly,
    this.inputFormatters,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color borderSide = const Color(0xFF011B33);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: label,
          size: 14,
          weight: FontWeight.w500,
        ),
        const YBox(6),
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: (inputValid ?? true) ? borderSide : Colors.red,
                width: (inputValid ?? true) ? 1.3 : 1.6),
          ),
          child: TextField(
            onTap: onTap,
            enabled: enabled,
            maxLength: maxLength,
            controller: controller,
            readOnly: readOnly ?? false,
            autocorrect: false,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkPrimary,
                ),
            inputFormatters: inputFormatters,
            obscureText: isHidden ?? false,
            cursorColor: Colors.black,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: suffix,
              prefixIcon: prefixIcon,
              contentPadding: const EdgeInsets.all(15),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelText: hintText ?? '',
              filled: true,
              fillColor: Colors.white,
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  color: const Color(0xFF011A32).withOpacity(.68)),
              border: outlineInputBorderBase,
              enabledBorder: outlineInputBorderBase,
              focusedBorder: outlineInputBorderBase,
            ),
          ),
        ),
        // (inputValid ?? false)
        //     ? const SizedBox.shrink()
        //     : BaseText(
        //         text: makeValid ?? '',
        //         size: 12,
        //         color: Colors.red,
        //         weight: FontWeight.w600,
        //       )
      ],
    );
  }
}

class SearchCountryTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const SearchCountryTextField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.transparent,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Country",
                hintStyle: TextStyle(
                    color: const Color(0xFF011B33).withOpacity(.40),
                    fontWeight: FontWeight.w400),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                isDense: true,
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class OnlyNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != ' ') valueToReturn += newValueString[i];

      if (!(newValueString[i] == ' ' ||
          newValueString[i] == '0' ||
          newValueString[i] == '1' ||
          newValueString[i] == '2' ||
          newValueString[i] == '3' ||
          newValueString[i] == '4' ||
          newValueString[i] == '5' ||
          newValueString[i] == '6' ||
          newValueString[i] == '7' ||
          newValueString[i] == '8' ||
          newValueString[i] == '9')) {
        valueToReturn = valueToReturn.substring(0, valueToReturn.length - 1);
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
