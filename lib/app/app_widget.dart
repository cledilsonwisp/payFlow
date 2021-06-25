import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_flow/app/modules/barcodeScanner/bar_code_scaner_page.dart';
import 'package:pay_flow/app/modules/home/home_page.dart';
import 'package:pay_flow/app/modules/insert_boleto/insert_boleto.dart';
import 'package:pay_flow/app/modules/login/login_page.dart';
import 'package:pay_flow/app/modules/splash/splash_page.dart';
import 'package:pay_flow/shared/themes/appColors.dart';


class AppWidget extends StatelessWidget {

  AppWidget (){
    SystemChrome.setPreferredOrientations(
     [ DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp]
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay flow',
      theme: ThemeData(primaryColor: AppColors.primary, primarySwatch: Colors.orange),
       initialRoute: '/splash',
       routes: {
         '/home': (context) => MyHomePage(),
         '/splash': (context) => SplashPage(),
         '/login': (context) => LoginPage(),
         '/barCode' : (context) => BarCodeScannerPage(),
         '/insertBoleto' : (context) => InsetBoletoPage()
       },
        // SplashPage(),
    );
  }
}
