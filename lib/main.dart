import 'package:flutter/material.dart';



void main() {

  printMessage(message: 'Deu certo');

}

void printMessage({ required String message}){
  print(message.replaceAll('Deu', 'Está'));
}