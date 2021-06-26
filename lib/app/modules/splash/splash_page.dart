import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appImages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          AnimatedCard(
            direction: AnimatedCardDirection.right,
            child: Center(child: Image.asset(AppImages.union))),
          AnimatedCard(
            direction: AnimatedCardDirection.left,
            child: Center(child: Image.asset(AppImages.logoFull))),
        ],
      ),
    );
  }
}