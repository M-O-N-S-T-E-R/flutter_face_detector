import 'package:a_test/testfolder/home_page_test.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


List<CameraDescription> cameras = [];

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          labelStyle: TextStyle(

              color: Colors.black

          ),
        ),
        appBarTheme: AppBarTheme(
            color: Colors.purpleAccent
        ),
      ),
      home: home_page_test(),
    );
  }
}