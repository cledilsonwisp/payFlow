import 'package:flutter/material.dart';
import 'package:pay_flow/app/modules/login/login_page.dart';
import 'package:pay_flow/shared/themes/appColors.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay flow',
      theme: ThemeData(primaryColor: AppColors.primary),
       home: LoginPage(),
        // SplashPage(),
    );
  }
}
