import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_fashion/constants/style_guides.dart';

class ApptextField extends StatelessWidget {
  const ApptextField({super.key, required this.hint, this.onChanged, this.inputFormatters, this.keyboardType});

  final String hint;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0XFF979797),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF979797),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF979797),
          ),
        ),
        hintText: hint,
        hintStyle: AppTextStyle.price(color: const Color(0XFF979797)),
      ),
      inputFormatters: inputFormatters,
      onChanged: onChanged,
    );
  }
}
