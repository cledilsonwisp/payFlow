import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:animated_card/animated_card.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {

  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 140,
            child: Stack(
              children: [
              Container(height: 40,width: double.maxFinite, color: AppColors.primary,),
              Positioned(top: 0,left:0, right: 0,  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(valueListenable: controller.boletosNotifier, builder: (_,boletos,__) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfo(size: boletos.length))
                )
              ),)
             ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:  ListTile(
                 title: Text( "Meus boletos",style: TextStyles.titleBoldHeading,),
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
            child: BoletoListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
