import 'package:alphafitness/LoginPage.dart';
import 'package:alphafitness/SignUp.dart';
import 'set_height_and_width.dart';
import 'package:alphafitness/UserSignUp.dart';
import 'package:alphafitness/userpage.dart';
import 'package:flutter/material.dart';
class selectmethod extends StatefulWidget {
  const selectmethod({Key? key}) : super(key: key);

  @override
  State<selectmethod> createState() => _selectmethodState();
}

class _selectmethodState extends State<selectmethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: getheight(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/select_pic.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>loginpage(usernameController: '',)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 50,
                      width: getwidth(context)*0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>signup()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 50,
                      width: getwidth(context)*0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white10,
                      ),
                      child: Center(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
