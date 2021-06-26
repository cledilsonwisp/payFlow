
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_paid_widget.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {

  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [     
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:  ListTile(
                 title: Text( "Meus Extratos",style: TextStyles.titleBoldHeading,),
                 trailing: Text("Todos",style: TextStyles.captionBody,),
               )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
              thickness: 1,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListPaid(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
