import 'package:alphafitness/set_height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class more_screen extends StatefulWidget {
  const more_screen({Key? key}) : super(key: key);

  @override
  State<more_screen> createState() => _more_screenState();
}

class _more_screenState extends State<more_screen> {
  late String URL;
  Future<void> _urlopen() async{
    if( await canLaunch(URL)){
      await launch(URL);
    }
    else{
      throw 'Instagram Opening Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        height: 53.0,
        color: Colors.black26,
        child: IconButton(
          padding: EdgeInsets.only(left: getwidth(context)*0.05),
          alignment: Alignment.centerLeft,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.red,
            size: 27.0,
          ),
        ),
      ),
      body: Container(
        height: getheight(context),
        width: getwidth(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.1),
                width: getwidth(context),height: getheight(context)*0.05,
              child: Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),),

              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  URL='https://www.instagram.com/alphafit.pk/';
                  _urlopen();
                },
                child: Container(
                  margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                  width: getwidth(context),
                  height: getheight(context)*0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white10,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: getwidth(context)*0.07),
                            child: Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 18),)),
                        Container(
                          margin: EdgeInsets.only(right: getwidth(context)*0.07),
                          width: getwidth(context)*0.19,
                          height: getheight(context)*0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage("assets/images/insta.jpg"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            SizedBox(height: 15,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(left: getwidth(context)*0.03,right: getwidth(context)*0.03),
                  width: getwidth(context),
                  height: getheight(context)*0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white10,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: getwidth(context)*0.07),
                            child: Text('Facebook',style: TextStyle(color: Colors.white,fontSize: 18),)),
                        Container(
                          margin: EdgeInsets.only(right: getwidth(context)*0.07),
                          width: getwidth(context)*0.19,
                          height: getheight(context)*0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/facebk.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
