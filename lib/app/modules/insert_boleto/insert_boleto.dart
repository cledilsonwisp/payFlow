import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/app/modules/insert_boleto/inset_boleto_controller.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/input_text/input_text._widget.dart';
import 'package:pay_flow/shared/widgets/set_label_button/set_label_buttons.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsetBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsetBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsetBoletoPageState createState() => _InsetBoletoPageState();
}

class _InsetBoletoPageState extends State<InsetBoletoPage> {

  final moneyController = MoneyMaskedTextController(decimalSeparator: ',',leftSymbol: 'R\$',);
  final dueDateController = MaskedTextController(mask: '00/00/0000' );
  final barcodeInputTextController = TextEditingController();
  final controller = InsetBoletoController();

  @override
    void initState() {
      if(widget.barcode != null){
        barcodeInputTextController.text = widget.barcode!;
      }
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.input,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93,vertical: 20 ),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40,),
             Form(
               key: controller.formKey,
               child: Column(children: [
                InputTextWidget(
                label: 'Nome do boleto',
                icon: Icons.description_outlined,
                onChanged: (value) {
                  controller.onChanged(name: value);
                },
                validator: controller.validateName,
              ),
              InputTextWidget(
                label: 'Vencimento',
                icon: FontAwesomeIcons.timesCircle,
                onChanged: (value) {
                  controller.onChanged(dueDate: value);
                },
                editingController: dueDateController,
                validator: controller.validateVencimento,
              ),
              InputTextWidget(
                label: 'Valor',
                editingController: moneyController,
                icon: FontAwesomeIcons.wallet,
                onChanged: (value) {
                  controller.onChanged(value:  moneyController.numberValue);
                },
                validator: (_) => controller.validateValor(moneyController.numberValue)
              ),
              InputTextWidget(
                label: 'Código',
                icon: FontAwesomeIcons.barcode,
                editingController: barcodeInputTextController,
                onChanged: (value) {
                  controller.onChanged(barcode: value );
                },
                validator: controller.validateCodigo,
              ),
             ],),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        enableSecondaryColor: true,
        primaryOntap: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryOntap: () {
          controller.cadastrarBoleto();
        },
      ),
    );
  }
}
