import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appImages.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';

class BoletoInfo extends StatelessWidget {
  final int size;
  const BoletoInfo({ Key? key, required this.size }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(7),
        color: AppColors.secondary
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.logomini, color: AppColors.background,),
            Container(width: 1,height: 32,color: AppColors.background,),
            Text.rich(TextSpan(
              text: "Você tem ",
              style: TextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "$size boletos\n",
                  style: TextStyles.captionBoldBackground,
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: TextStyles.captionBackground,
                ),
              ],
            ))
        ],
        ),
      ),
    );
  }
}