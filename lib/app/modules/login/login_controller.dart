import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pay_flow/shared/auth/auth_controller.dart';
import 'package:pay_flow/shared/models/user_model.dart';

class LoginController {
  final auth = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(name: response!.displayName!, photoUrl: response.photoUrl!);
      auth.setUser(context, user);
      print(response);
    } catch (error) {
      auth.setUser(context, null);
      print(error);
    }
  }
}
