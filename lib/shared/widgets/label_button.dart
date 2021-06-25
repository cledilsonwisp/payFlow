import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback ontap;
  final TextStyle? style;
  const LabelButton(
      {Key? key, required this.label, required this.ontap, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
        onPressed: ontap,
        child: Text(
          label,
           style: style ?? TextStyles.buttonHeading),
      ),
    );
  }
}
