import 'package:flutter/material.dart';
class startingscreen extends StatefulWidget {
  const startingscreen({Key? key}) : super(key: key);

  @override
  State<startingscreen> createState() => _startingscreenState();
}

class _startingscreenState extends State<startingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/p1.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Get Fit'
                    'Get Strong'
                    'Get Healthy',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
