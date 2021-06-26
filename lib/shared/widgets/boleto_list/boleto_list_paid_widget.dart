import 'package:animated_card/animated_card.dart';
import 'package:animated_card/animated_card_direction.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListPaid extends StatefulWidget {
   final BoletoListController controller;
  const BoletoListPaid({ Key? key, required this.controller }) : super(key: key);

  @override
  _BoletoListPaidState createState() => _BoletoListPaidState();
}

class _BoletoListPaidState extends State<BoletoListPaid> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(valueListenable: widget.controller.boletosPagosNotifier, builder: (_, boletos, __) =>  AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Column(
        children: boletos.map((e) => BoletoTileWidget(data: e,)).toList()
      ),
    ));
  }
}