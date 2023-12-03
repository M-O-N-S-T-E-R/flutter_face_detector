
import 'package:a_test/testfolder/utill/face_detector_painter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';


import 'camera_view.dart';

class face_detector_screen extends StatefulWidget {
  const face_detector_screen({super.key});

  @override
  State<face_detector_screen> createState() => _face_detector_screenState();
}

class _face_detector_screenState extends State<face_detector_screen> {

  // create face detector object

  final FaceDetector _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
      enableContours: true,
      enableClassification: true
  )
      );
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint?  _customPaint ;
  String? _text;


  @override
  void dispose() {
    // TODO: implement dispose
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  camera_view(
      title: "Face Detector",
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage){
        processImage(inputImage);
      },
      initalDirection: CameraLensDirection.front,
    );
  }

  Future<void>processImage(final InputImage inputImage)async{
    if(!_canProcess)return;
    if(!_isBusy)return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if(inputImage.inputImageData?.size != null &&
    inputImage.inputImageData?.imageRotation != null ){
      final painter = FaceDetectorPainter(faces, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter,);

    }
    else{
      String text = 'faces found: ${faces.length}\n\n';

      for(final face in faces){

        text += 'face: ${face.boundingBox}\n\n';
      }
      _text = text;
      _customPaint = null;
    }
    _isBusy = false;
    if(mounted){
      setState(() {});
    }
  }
}
