import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/appColors.dart';
import 'package:pay_flow/shared/themes/appImages.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';
import 'package:pay_flow/shared/widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.0455,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.554,
                height: size.height * 0.459,
              ),
            ),
            Positioned(
              bottom: size.height * 0.07, left: 0, right: 0,
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding: const EdgeInsets.only(left:70, right: 70,top: 30),
                    child: Text("Organize seus boletos em um só lugar",style:TextStyles.titleHome,textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40.0,left: 40,right: 40),
                    child: SocialLoginButton(onTap: (){
                      print('clicou');
                    },),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
