import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
class articleeggs extends StatefulWidget {
  const articleeggs({Key? key}) : super(key: key);

  @override
  State<articleeggs> createState() => _articleeggsState();
}

class _articleeggsState extends State<articleeggs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        height: 53.0,
        color: Colors.black26,
        child: Row(
          children: [
            IconButton(
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
            Spacer(),
            IconButton(
              padding: EdgeInsets.only(right: 20.0),
              alignment: Alignment.centerLeft,
              onPressed: (){},
              icon: Icon(
                Icons.share,
                color: Colors.red,
                size: 27.0,
              ),

            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: getwidth(context)*0.05,left: getwidth(context)*0.04,right: getwidth(context)*0.04),

            height: getheight(context)*0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage ("assets/images/eggs.jpg"),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: getwidth(context)*0.05),
            alignment: Alignment.centerLeft,
            width: getwidth(context)*0.6,
            height: getwidth(context)*0.22,
            child: Text(
              'What is Special About Eggs?',
              style: TextStyle(
                fontSize:
                  23.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            margin: EdgeInsets.only(left: getwidth(context)*0.052),
            width: getwidth(context)*0.2,
            height: getwidth(context)*0.06,
            child: Center(
              child: Text(
                'Nutrition',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 2,left: getwidth(context)*0.052,right: getwidth(context)*0.052 ),
            width: getwidth(context),
            height: 1.5,
            color: Colors.white,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 9.0,
          ),
          Container(
            margin: EdgeInsets.only(left: getwidth(context)*0.052,right: getwidth(context)*0.052 ),
            width: getwidth(context),
            height: getwidth(context)*0.05,
            child: Text(
              '2 min read',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Container(
            margin: EdgeInsets.only(left: getwidth(context)*0.052,right: getwidth(context)*0.052 ),
            width: getwidth(context),
            height: 1.5,
            color: Colors.white,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: Text(
              'Eggs provide a valuable source of quality protein – while also containing 13 essential vitamins and minerals, alongside necessary omega-3 fatty acids and antioxidants. 60% of the high-quality protein in eggs can be found in the egg white, while the yolk contains the rest, along with vital healthy fats, vitamins, minerals and antioxidants – all compounding for a valuable contribution to your daily nutritional needs. ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
          ),

          SizedBox(
            height: 8.0,
          ),

          Container(
            child: Text(
              'Eggs are widely considered to be a valuable source of quality protein. Proteins are the building blocks of life, essential for the strength and repair of muscle and tissue – with one single egg containing about 6.3 grams of protein. The powerful advantage of the protein in eggs links to the fact that eggs contain all nine essential amino acids – in sufficient amounts – to support effective muscle growth, recovery and maintenance. ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0),
          ),
          SizedBox(
            height: 8.0,
          ),

          Container(
            child: Text(
              'Eggs help increase high-density lipoprotein (HDL) levels – or “good” cholesterol as it’s commonly known – and this is one reason why eggs have been found to have little to no effect on heart disease risk. It is low-density lipoprotein (LDL) –  or "bad" cholesterol – that can put heart health at risk. Meals high in saturated fats and trans-fats such as deep-fried takeaway foods are the key culprits when it comes to increased risk levels of LDL cholesterol.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05,top: 10.0,bottom: 20.0),
          ),
              ],
            ),


      ),
    );

  }
}
