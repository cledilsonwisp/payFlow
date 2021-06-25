


import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_flow/app/modules/barcodeScanner/bar_code_scanner_status.dart';

class BarCodeScannerController{
  final statusNotifier = 
                ValueNotifier<BarCondeScannerStatus>(BarCondeScannerStatus());
  BarCondeScannerStatus get status =>  statusNotifier.value;
  set status(BarCondeScannerStatus status) => statusNotifier.value = status;
  
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  CameraController? cameraController;

  void getAvailableCamera() async{

    try {
       final response = await availableCameras();
       final camera = response.firstWhere((element) => element.lensDirection == CameraLensDirection.back);
        cameraController = CameraController(
         camera,
          ResolutionPreset.max,
          enableAudio: false);
          await cameraController!.initialize();
        scanWithCamera();
        listenCamera();
    } catch (e) {
        status = BarCondeScannerStatus.error(e.toString());
    }
  }

   void scanWithCamera() {
      status = BarCondeScannerStatus.available(); 
    Future.delayed(Duration(seconds: 20)).then((value) {
      if(status.hasBarCode == false)
       status = BarCondeScannerStatus.error("Timeout de leitura de boleto");
    });

  }

   void scanWithImagePicker() async {
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
    }

   Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      var barcode;
      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }
      if (barcode != null && status.barcode.isEmpty) {
        status = BarCondeScannerStatus.barcode(barcode);
        cameraController!.dispose();       
        await barcodeScanner.close(); 
      
      } 
      return;
    } catch (e) {
      print("ERRO DA LEITURA $e");
    }
  }

  void listenCamera(){
      if (cameraController!.value.isStreamingImages == false)
      cameraController!.startImageStream((cameraImage) async {
       if(status.stopScanner == false)
        try {
          
          final bytes = cameraImage.planes[0].bytes;
          final Size imageSize =
              Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());
          final InputImageRotation imageRotation =
              InputImageRotation.Rotation_0deg;
          final InputImageFormat inputImageFormat =
              InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                  InputImageFormat.NV21;
          final planeData = cameraImage.planes.map(
            (Plane plane) {
              return InputImagePlaneMetadata(
                bytesPerRow: plane.bytesPerRow,
                height: plane.height,
                width: plane.width,
              );
            },
          ).toList();

          final inputImageData = InputImageData(
            size: imageSize,
            imageRotation: imageRotation,
            inputImageFormat: inputImageFormat,
            planeData: planeData,
          );
          final inputImageCamera = InputImage.fromBytes(
              bytes: bytes, inputImageData: inputImageData);
           scannerBarCode(inputImageCamera);
        } catch (e) {
          print(e);
        }
      });
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
     cameraController!.dispose();
    }
  }
  }
