import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {


  BoletoModel  model = BoletoModel();
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos (List<BoletoModel> value) => boletosNotifier.value = value;

   final boletosPagosNotifier =
      ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletosPagos => boletosPagosNotifier.value;
  set boletosPagos(List<BoletoModel> value) =>
      boletosPagosNotifier.value = value;

    BoletoListController(){
      getBoletos();
    }
  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('boletos') ?? <String>[];
       boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }

  void getpagos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos");
      boletos = response!.map((e) => BoletoModel.fromJson(e)).toList();
      boletosPagos = boletos.where((e) => e.isPaid == true).toList();
    } catch (e) {}
  }

  void setarEstado(String name, bool setar) async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos");
      boletos = response!.map((e) => BoletoModel.fromJson(e)).toList();
      instance.remove("boletos");
      response.clear();
      BoletoModel boleto =
          boletos.singleWhere((element) => element.name == name);
      model = model.copyWith(
        barcode: boleto.barcode,
        dueDate: boleto.dueDate,
        isPaid: setar,
        name: boleto.name,
        value: boleto.value,
      );
      boletos.removeWhere((element) => element.name == name);
      boletos.add(model);
      boletosPagos = boletos.where((e) => e.isPaid == true).toList();
      boletos.map((e) => response.add(e.toJson())).toList();
      await instance.setStringList("boletos", response);
    } catch (e) {}
  }
}
