import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
class articlealmonds extends StatefulWidget {
  const articlealmonds({Key? key}) : super(key: key);

  @override
  State<articlealmonds> createState() => _articlealmondsState();
}

class _articlealmondsState extends State<articlealmonds> {
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
                    image: AssetImage ("assets/images/almonds.jpg"),
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
                'What is Special About Almonds?',
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
                '1 min read',
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
                'Almonds are high in antioxidants, vitamin E, protein, and fiber. This nutrient-rich nut is an excellent addition to any diet since it is a versatile ingredient linked to several health benefits. ',
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
                'Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree. They are native to the Middle East, but the United States is now the world’s largest producer.The almonds you can buy in stores usually have the shell removed, revealing the edible nut inside. They are sold either raw or roasted.They are also used to produce products like almond milk, oil, butter, flour, paste, or marzipan.',
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
                'Almonds are also high in phytic acid, a substance that binds certain minerals and prevents them from being absorbed by the body. While phytic acid is generally considered a healthy antioxidant, it also slightly reduces the amount of iron, zinc, and calcium your body absorbs from almonds.',
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
