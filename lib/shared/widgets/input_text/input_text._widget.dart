import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';

class InputTextWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? editingController;
  final void Function(String value) onChanged;


  const InputTextWidget({Key? key, required this.label, required this.icon,this.initialValue, this.validator, this.editingController, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom:18.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: initialValue,
              onChanged: onChanged,
              controller: editingController,
              validator: validator,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                labelStyle: TextStyles.input,
                contentPadding: EdgeInsets.zero,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(icon,color: AppColors.primary,),
                    ),
                    Container(
                      width: 1,
                      color: AppColors.stroke,
                      height: 48,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ],
        ),
      ),
    );
  }
}
