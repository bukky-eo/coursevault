import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'icon.dart';

class CustomButton extends TextButton {
  CustomButton({
    Key? key,
    Function()? onPressed,
    required String text,
    bool loading = false,
    bool outlined = false,
    bool destructive = false,
    bool secondary = false,
    bool white = false,
    bool mini = false,
    String? prefixIcon,
    String? suffixIcon,
    Color? color,
    GlobalKey<FormState>? formKey,
    required BuildContext context,
  }) : super(
    key: key,
    child: SizedBox(
      height: 24,
      child: Center(
        child: loading
            ? SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 1.4,
            valueColor: AlwaysStoppedAnimation(
              outlined ? CustomColors.primary : CustomColors.white,
            ),
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              CustomIcon(
                height: mini ? 16 : 20,
                icon: prefixIcon,
              ),
            if (prefixIcon != null)
              SizedBox(
                width: mini ? 8: 12,
              ),
            Text(
              text,
              style: TextStyle(
                color: outlined
                    ? CustomColors.primary.withOpacity(0.9)
                    : CustomColors.white,
                fontSize: mini ? 12: 14,
              ),
            ),
            if (suffixIcon != null)
              SizedBox(
                width: mini ? 8: 12,
              ),
            if (suffixIcon != null)
              CustomIcon(
                icon: suffixIcon,
              ),
          ],
        ),
      ),
    ),
    onPressed: onPressed,
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return CustomColors.black.withOpacity(0.4);
          } else if (states.contains(MaterialState.pressed)) {
            return outlined
                ? CustomColors.primary.withOpacity(0.9)
                : destructive
                ? CustomColors.primary.withOpacity(0.9)
                : secondary
                ? CustomColors.primary
                : CustomColors.primary.withOpacity(0.9);
          }
          return color ??
              (outlined
                  ? CustomColors.white
                  : destructive
                  ? CustomColors.primary
                  : secondary
                  ? CustomColors.black.withOpacity(0.2)
                  : CustomColors.primary);
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return CustomColors.black.withOpacity(0.4);
          } else if (states.contains(MaterialState.pressed)) {
            return outlined
                ? CustomColors.primary.withOpacity(0.9)
                : destructive
                ? CustomColors.primary.withOpacity(0.9)
                : secondary
                ? CustomColors.primary
                : CustomColors.primary.withOpacity(0.9);
          }
          return color ??
              (outlined
                  ? CustomColors.white
                  : destructive
                  ? CustomColors.primary
                  : secondary
                  ? CustomColors.black.withOpacity(0.2)
                  : CustomColors.primary);
        },
      ),
      padding: MaterialStateProperty.resolveWith(
            (states) {
          return EdgeInsets.all(mini ? 6 : 12);
        },
      ),
      alignment: Alignment.center,
      // elevation: MaterialStateProperty<double>().,
      shape: MaterialStateProperty.resolveWith(
            (states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
            side: outlined && color == null
                ? BorderSide(
              color: CustomColors.primary.withOpacity(
                  states.contains(MaterialState.pressed) ? 0 : 1),
            )
                : BorderSide.none,
          );
        },
      ),
    ),
  );
}
