import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class BarCondeScannerStatus{


  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  

  BarCondeScannerStatus({this.stopScanner = false, this.isCameraAvailable = false,this.error = '', this.barcode = '',});
  
  //!Construtores específicos
  factory BarCondeScannerStatus.available() =>
    BarCondeScannerStatus(isCameraAvailable: true, stopScanner: false);

  factory BarCondeScannerStatus.error(String error) => 
    BarCondeScannerStatus(error: error, stopScanner: true);

  factory BarCondeScannerStatus.barcode(String barcode) =>
    BarCondeScannerStatus(barcode: barcode,stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarCode => barcode.isNotEmpty;

}