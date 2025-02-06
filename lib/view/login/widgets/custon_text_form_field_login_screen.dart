import 'package:flutter/material.dart';
import 'package:quiz_app/core/resources/color_manger.dart';

class CustomTextFormFieldLoginScreen extends StatelessWidget {
  const CustomTextFormFieldLoginScreen({
    super.key,
    required this.onChanged,
    required this.keyForm,
    required this.validator,
  });
  final ValueChanged<String> onChanged;
  final GlobalKey<FormState> keyForm;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: TextFormField(
        keyboardType: TextInputType.name,
        validator: validator,
        onChanged: onChanged,
        cursorColor: ColorManger.kPurpleColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }
}
