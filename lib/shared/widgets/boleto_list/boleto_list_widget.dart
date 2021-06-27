import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:pay_flow/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:pay_flow/shared/widgets/label_button.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;
  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosNotifier,
        builder: (_, boletos, __) => AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: Column(
                  children: boletos
                      .map((e) => InkWell(
                          focusColor: AppColors.primary,
                          onTap: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: Container(
                                  color: Colors.white,
                                  height: 293,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 160, vertical: 15),
                                        child: Divider(
                                          color: AppColors.stroke,
                                          height: 1,
                                          thickness: 2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 78, left:78, top: 10, bottom: 25),
                                        child: Text.rich(
                                          TextSpan(
                                            text: 'O boleto ',
                                            style: TextStyles.titleBody,
                                            children: [
                                              TextSpan(
                                                text: '${e.name}',
                                                style:TextStyles.titleBoldHeading,
                                              ),
                                              TextSpan(
                                                  text: ' no valor de R\$ ',
                                                  style: TextStyles.titleBody),
                                              TextSpan(
                                                  text: '${e.value}',
                                                  style: TextStyles
                                                      .titleBoldHeading),
                                              TextSpan(
                                                  text: ' Foi pago?',
                                                  style: TextStyles.titleBody),
                                            ],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom:25.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                           SizedBox(width: 15,),
                                            Expanded(
                                              child: LabelButton(
                                                label: 'Ainda não',
                                                boxDecoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                    border: Border.fromBorderSide(
                                                        BorderSide(
                                                            color:
                                                                AppColors.stroke)),
                                                    color: AppColors.background),
                                                ontap: () {},
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            Expanded(
                                              child: LabelButton(
                                                label: 'Sim',
                                                style: TextStyles.buttonBackground,
                                                ontap: () {
                                                  widget.controller.setarEstado('${e.name}', true);
                                                  Navigator.pop(context);
                                                },
                                                boxDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color: AppColors.primary),
                                              ),
                                            ),
                                            SizedBox(width: 15,)
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 1,
                                      height: 1,
                                      color: AppColors.stroke,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.trashAlt,color: Colors.red,),
                                          SizedBox(width: 20,),
                                          Text("Deletar boleto",style: TextStyles.captionBody,)
                                        ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: BoletoTileWidget(
                            data: e,
                          )))
                      .toList()),
            ));
  }
}
