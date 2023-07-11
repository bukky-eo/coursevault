import 'package:coursevault/assets/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class CustomTextField extends TextFormField {
  CustomTextField({
    Key? key,
    FocusNode? focusNode,
    Function(String)? function,
    Function()? onTap,
    TextInputAction? textInputAction,
    bool enabled = true,
    bool readOnly = false,
    bool autoFocus = true,
    bool? obscure,
    Widget? prefix,
    Widget? suffix,
    TextEditingController? controller,
    double? fontSize,
    int? minLines,
    int? maxLines,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
    Iterable<String>? autofillHints,
    TextInputType type = TextInputType.text,
    String? tag,
    Color? color,
    String? hint,
    String? label,
    Color? fillColor,
    bool?isEditing,

    ValueChanged<String>? onChanged,
  }) : super(
    autocorrect: false,
    key: key,
    focusNode: focusNode,
    onTap: onTap,
    onSaved: onSaved,
    autofillHints: autofillHints,
    onFieldSubmitted: function,
    textInputAction: textInputAction ?? TextInputAction.next,
    enabled: enabled,
    readOnly: readOnly,
    autofocus: autoFocus,
    textCapitalization: obscure != null
        ? TextCapitalization.none
        : TextCapitalization.sentences,
    controller: controller,
    obscureText: obscure ?? false,
    keyboardType: type,
    cursorColor: CustomColors.black,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      fillColor: fillColor ?? color ?? CustomColors.textField,
      filled: true,
      // isDense: true,
      enabled: enabled,
      // fillColor: CustomColors.white,
      // filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: CustomColors.stroke,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: CustomColors.stroke,
        ),
      ),
      hintText: hint,
      hintStyle: CustomTextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: CustomColors.black.withOpacity(0.4),
      ),
      labelText: label,
      labelStyle: CustomTextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: CustomColors.black.withOpacity(0.4),
      ),
      floatingLabelStyle: CustomTextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: CustomColors.black.withOpacity(0.6),
      ),
      // helperText:
      //     obscure != null ? 'Password must be atleast 6 digits' : null,
      // helperStyle: CustomTextStyle(context,
      //   fontWeight: FontWeight.normal,
      //   fontSize: 12,
      //   color: SwirgeColors.primary,
      // ),
      prefixIcon: prefix == null
          ? null
          : Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: prefix,
      ),
      prefixIconConstraints: const BoxConstraints(
        maxHeight: 20,
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: suffix,
      ),
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 28,
      ),
    ),
    style: CustomTextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 12,
      color: CustomColors.black,
    ),
    onChanged: onChanged,
    minLines: minLines ?? maxLines,
    maxLines: maxLines ?? 1,
    validator: validator,
  );
}

