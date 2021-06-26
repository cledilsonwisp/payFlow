import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{

 var _isAuthenticated = false;
 UserModel? _user;
 
 UserModel get user => _user!;

 void setUser(BuildContext context, UserModel? user){
   if(user != null){
      saveUser(user);
      _user = user;
     Navigator.pushReplacementNamed(context, '/home',arguments: user);
   } else {
     _isAuthenticated = false;
     Navigator.pushReplacementNamed(context, '/login');
   }
 }

 Future<void> saveUser(UserModel user) async {
   final instance = await SharedPreferences.getInstance();
   await instance.setString('user', user.toJson());
   return;
 }
 
 Future<void> currentUser(BuildContext context) async{
   await Future.delayed(Duration(seconds: 2));
  final instance = await SharedPreferences.getInstance();
  if(instance.containsKey('user')){
    final json = instance.get('user') as String;
  setUser(context, UserModel.fromJson(json));
  }else{
    setUser(context, null);
  }
  return;
 }

}