import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/app/app_widget.dart';
import 'package:pay_flow/shared/themes/appTextStyle.dart';



void main() {
  runApp(AppFireBase());
}

class AppFireBase extends StatefulWidget {
  const AppFireBase({Key? key}) : super(key: key);

  @override
  _AppFireBaseState createState() => _AppFireBaseState();
}

class _AppFireBaseState extends State<AppFireBase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o firebase",style: TextStyles.titleBoldHeading,
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        } else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
