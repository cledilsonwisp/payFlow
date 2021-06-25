import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/set_label_button/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String primaryLabel;
  final VoidCallback primaryOntap;
  final String secondaryLabel;
  final VoidCallback secondaryOntap;
  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.primaryLabel,
      required this.primaryOntap,
      required this.secondaryLabel,
      required this.secondaryOntap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.black.withOpacity(0.6),)),
                Column(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Text.rich(
                      TextSpan(text: title,
                       style: TextStyles.buttonBoldHeading,
                       children: [
                        TextSpan(text: '\n$subTitle',style: TextStyles.buttonHeading,)
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.stroke,),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOntap: primaryOntap,
                      secondaryLabel: secondaryLabel,
                      secondaryOntap: secondaryOntap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
