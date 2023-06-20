import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'firebase_toast.dart';
import 'set_height_and_width.dart';
class verify_with_code extends StatefulWidget {
  final String verificationId;
  const verify_with_code({Key? key,required this.verificationId}) : super(key: key);

  @override
  State<verify_with_code> createState() => _verify_with_codeState();
}

class _verify_with_codeState extends State<verify_with_code> {
  bool loading=false;
  final auth=FirebaseAuth.instance;
  final phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: getheight(context),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/get_started_pic.jpg"),
              fit: BoxFit.cover,

            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(

              margin: EdgeInsets.only(top:getheight(context)*0.15,left: getwidth(context)*0.05,right: getwidth(context)*0.05),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.white
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Field is missing';
                  }
                },

                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: "6-digit code",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                        )

                    ),
                    prefixIcon: Icon(Icons.phone,
                      color: Colors.red,)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {

                  loading=true;
                });
         final credentials=PhoneAuthProvider.credential(verificationId: widget.verificationId,
             smsCode: phoneController.text.toString(),
         );
         try{
                   await auth.signInWithCredential(credentials);
                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>homescreen()), (route) => false);
         }catch(e){
           setState(() {

             loading=false;
           });
           toast(e.toString());
         }
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>login_with_phone()));
              },
              child: Container
                (
                height: 50,
                width: getwidth(context)*0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: loading ? CircularProgressIndicator(
                    color: Colors.white,
                  ) :
                  Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
