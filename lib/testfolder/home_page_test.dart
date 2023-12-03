import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'face_detector_screen.dart';

class home_page_test extends StatefulWidget {
  const home_page_test({super.key});

  @override
  State<home_page_test> createState() => _home_page_testState();
}

class _home_page_testState extends State<home_page_test> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Face Detector"
        ),

      ),
      body: _body(),
    );
  }

  Widget _body() => Center(
    child: SizedBox(
      width: 350,
      height: 80,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
              color: Colors.blue,
              width: 1,
                style: BorderStyle.solid
            )
          ),
        ),
        onPressed: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=> face_detector_screen()
          )
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconWidget(Icons.arrow_forward_ios),

              Text(
                "Go To Face Detection",
                style: TextStyle(
                  fontSize: 20.0,

                ),
              ),

            _buildIconWidget( Icons.arrow_back_ios),

          ],
        ),

      ),
    ),
  );

  Widget _buildIconWidget(final IconData icon) =>Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12.0),
      child: Icon(
        icon,
        size: 24,
      ),
    );


}
