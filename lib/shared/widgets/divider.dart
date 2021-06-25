import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appColors.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}