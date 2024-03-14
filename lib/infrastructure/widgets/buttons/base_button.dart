import 'package:flutter/material.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/buttons/button_icon_type.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/widgets/hide_widget.dart';

class CBButtonContent extends StatelessWidget {
  const CBButtonContent({
    super.key,
    required this.fillParent,
    required this.buttonIconType,
    required this.prefixIcon,
    required this.keepBalance,
    required this.suffixIcon,
    required this.label,
    required this.textStyle,
  });

  final bool fillParent;
  final ButtonIconType buttonIconType;
  final Widget? prefixIcon;
  final bool keepBalance;
  final Widget? suffixIcon;
  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: fillParent ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: buttonIconType.mainAxisAlignment,
      children: [
        if (prefixIcon != null) prefixIcon!,
        if (keepBalance && prefixIcon == null && suffixIcon != null)
          CBHideWidget(
            child: suffixIcon!,
            visible: false,
          ),
        Text(
          label,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        if (suffixIcon != null) suffixIcon!,
        if (keepBalance && suffixIcon == null && prefixIcon != null)
          CBHideWidget(
            child: prefixIcon!,
            visible: false,
          )
      ],
    );
  }
}
