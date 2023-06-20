import 'package:alphafitness/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'set_height_and_width.dart';
class morenutrition extends StatefulWidget {
  const morenutrition({Key? key}) : super(key: key);

  @override
  State<morenutrition> createState() => _morenutritionState();
}
class _morenutritionState extends State<morenutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 53.0,
          color: Colors.black26,
          child: IconButton(
            padding: EdgeInsets.only(left: getwidth(context)*0.05),
            alignment: Alignment.centerLeft,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>homescreen()));
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.red,
              size: 27.0,
            ),

          ),
      ),
      backgroundColor: Colors.black,
        body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getheight(context)*0.05,
          ),
        Container(
        width: getwidth(context),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children:[
    Container(
      width: getwidth(context)*0.5,
    margin: EdgeInsets.only(left: getwidth(context)*0.06),
    child: Text(
    'HEALTHY FOODS',

    style: TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Spacer(

    ),
    Container(
    margin: EdgeInsets.only(),
    child: IconButton(
    onPressed: (){
      showModalBottomSheet(

        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context){
        return Container(
          decoration: BoxDecoration(
            color: Colors.black
              ,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          
        width: getwidth(context),
        height: getheight(context)*0.5,
        child:
          SingleChildScrollView(
            child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                Container(
                  child: Text(
                    'Healthy food',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 15,top: 10),
                  width: getwidth(context)*0.4,
                  height: getheight(context)*0.05,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 25.0,
                    color: Colors.white,

                  ),
                   onPressed: (){
                    Navigator.pop(context);
                   },
                )
              ],
            ),
                      Container(
                        width: getwidth(context),
                        height: 1.5,
                        color: Colors.white,
                      ),
                      Container(
                        child: Text(
                          'A healthy diet may help to prevent certain long-term (chronic) diseases such as heart disease, stroke and diabetes. It may also help to reduce your risk of developing some cancers and help you to keep a healthy weight. This leaflet explains the principles of a healthy diet. It is general advice for most people. The advice may be different for certain groups of people, including pregnant women, people with certain health problems or those with special dietary requirements.',
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
                  'Your body needs energy to work normally and keep you alive. You obtain this energy from nutrients in the food that you eat - mostly, carbohydrates, fats and proteins. Minerals and vitamins are other nutrients that are also important in your diet to help your body stay healthy. It is important to find the right balance between these different nutrients to achieve maximum health benefits',
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
                  'As a general rule, vegetables, fruits and starchy foods should provide the bulk of most of your meals. The remaining part of your diet should be made up from milk and dairy foods and protein foods. As mentioned above, you should limit the amount of foods and drinks that are high in fat or sugar.',
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
              InkWell(

                child: Container(
                  width: getwidth(context),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 15.0,left: getwidth(context)*0.05,right: getwidth(context)*0.05,bottom: 20.0),
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ));
        }
      );
    },
    icon: Icon(Icons.info),
    color: Colors.white,
      iconSize: 22.0,
    ),
    ),
    ],
    ),
    ),
          SizedBox(
            height: 10.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

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
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Almonds',
                        style: TextStyle(

                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Almonds contain lots of healthy fats, fiber, protein, magnesium, and vitamin E. The health benefits of almonds include lower blood sugar levels, reduced blood pressure, and lower cholesterol levels',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/dates.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Dates',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                          'Dates are one of the best ingredients for a daily diet because of their numerous health benefit. The date palm (Phoenix Dactylifera L.) is widely grown in hot, dry locations, primarily in the Middle East and North Africa, and supplies nutrition.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/brown_bread.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Brown Bread',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Brown Bread is a delicious blend of whole grains and wheat that can be an excellent source of many nutrients, including magnesium, iron, vitamin B3, and dietary fiber.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/chicken_breast.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Chicken Breast',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'This type of poultry is an excellent source of lean protein. Chicken is also a good source of vitamin B, vitamin D, calcium, iron, zinc, and trace amounts of vitamin A and vitamin C.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/peanuts.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Peanuts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Peanuts are high in unsaturated fat, mostly monounsaturated fat (the type that is also in olive and rapeseed oil). This means they are high in calories. But they are also a source of fibre, protein and a range of vitamins and minerals.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/salad.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Cucumber Salad',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Cucumbers contain magnesium, potassium, and vitamin K. These 3 nutrients are vital for the proper functioning of the cardiovascular system. In taking magnesium and potassium can lower down blood pressure. ',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/oatss.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Oats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Studies show that oats and oatmeal have many health benefits. These include weight loss, lower blood sugar levels, and a reduced risk of heart disease. Oats are among the healthiest grains on earth.',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(

              width: getwidth(context)*0.9,
              height: getheight(context)*0.47,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0,left: getwidth(context)*0.02,right: getwidth(context)*0.02),

                      height: getheight(context)*0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage ("assets/images/soyabean.jpg"),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03),
                      child: Text(
                        'Soy Beans',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: getwidth(context)*0.045,top: getwidth(context)*0.03,right: getwidth(context)*0.045),
                      child: Text(
                        'Soybeans and soy foods may reduce the risk of a range of health problems, including cardiovascular disease, stroke, coronary heart disease (CHD) and some cancers, as well as improving bone health. ',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.02,bottom: 20)
          ),
          SizedBox(
            height: 5.0,
          ),
          ],
        ),
    )));
  }
}
