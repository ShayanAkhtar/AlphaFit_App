import 'package:alphafitness/SelectMethod.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'HomeScreen.dart';
import 'set_height_and_width.dart';
class firstscreen extends StatefulWidget {
  const firstscreen({Key? key}) : super(key: key);

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mainscreenpic.jpg'),
              fit: BoxFit.cover,
            )
        ),

        child: Container(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(top: getheight(context) * 0.05),
                //       child: Text(
                //         'Alpha',
                //         style: TextStyle(
                //             fontSize: 30.0,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.red,
                //         ),
                //       ),
                //     ),
                //     Container(
                //       margin: EdgeInsets.only(top: getheight(context) * 0.05),
                //       child: Text(
                //         '.Fit',
                //         style: TextStyle(
                //           fontSize: 30.0,
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Center(
            child:
                InkWell(
                  onTap: (){
        if(_auth.currentUser!=null) {
         UserRecords().Useremail=_auth.currentUser?.email.toString();
         UserRecords().Userid=_auth.currentUser?.uid.toString();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
        }
        else{
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => signup()));
        }
        },

            child:
                      Container(
                        margin: EdgeInsets.only(top: getheight(context) * 0.91),
                       width: getwidth(context)*0.85,
                        height: getheight(context)*0.065,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 21.0,
                            )

                          ),
                        ),
                      ),
                ),

                  ),
              ],
            )
        ),
      ),
    );
  }
  }
