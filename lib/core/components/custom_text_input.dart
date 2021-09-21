import 'package:flutter/material.dart';
import 'package:nestle_app/core/localization/app_localization.dart';

class CustomTextInput extends StatelessWidget {
  final Color? textColor;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? errorText;
  final bool? obsecureText;
  final Function(String text)? onChanged;
  final TextEditingController? controller;
  final double? borderRadius;
  final double? contentPadding;
  final double? fontSize;
  final double? elevation;
  final TextInputAction? textInputAction;
  final Function(String value)? onFieldSubmitted;

  const CustomTextInput(
      {this.textColor,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.errorText,
      this.obsecureText,
      this.onChanged,
      this.controller,
      this.borderRadius,
      this.fontSize,
      this.elevation,
      this.contentPadding,
      this.textInputAction,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? 0),
      ),
      elevation: elevation ?? 0,
      child: TextFormField(
        textInputAction: textInputAction ?? TextInputAction.done,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: contentPadding ?? 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
          ),
          errorText: errorText,
          errorStyle: TextStyle(height: 0, fontSize: 0),
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(minWidth: 60),
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(minWidth: 60),
          labelText: labelText,
        ),
        style: TextStyle(
            color: textColor ?? Colors.black, fontSize: fontSize ?? 18),
        onChanged: onChanged,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.getString("empty_error");
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted ?? null,
      ),
    );
  }
}
