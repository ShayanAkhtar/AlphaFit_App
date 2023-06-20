import 'package:alphafitness/LoginPage.dart';
import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/set_height_and_width.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


import 'MyProfile.dart';
class user_profile extends StatefulWidget {
  const user_profile({Key? key}) : super(key: key);

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {

  final ref = FirebaseDatabase.instance.ref('users');
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Colors.black,
        child: Center(
          child: TextButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>loginpage(usernameController: '')), (route) => false);
            },
            child: Text('Sign Out',style: TextStyle(color: Colors.red,
                fontSize: 15,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
        ,fontSize: 20),),
      ),
      body: Container(
        height: getheight(context),
        width: getwidth(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // InkWell(
              //   child: Container(
              //     child: CircleAvatar(
              //
              //
              //       backgroundColor: Colors.white10,
              //       radius:55,
              //
              //     ),
              //   ),
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>user_profile()));
              //   },
              // ),
              SizedBox(
                height: 10,
              ),
             Container(

               width: getwidth(context),
               height: getheight(context)*0.17,
               child: FirebaseAnimatedList(

                 query: ref.orderByChild('Email').equalTo(_auth.currentUser?.email.toString()),
                  itemBuilder: (context,snapshot,animation,index){
                   return Container(

                     height: getheight(context)*0.2,
                     width: getwidth(context),
                     child: Column(
                       children: [
                         CircleAvatar(
                           child: Center(
                             child: Row(
                               children: [
                                 Text(
                                   snapshot.child('First Name').value.toString().substring(0,1
                                   ),
                                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                 SizedBox(width: 2,),
                                 Text(
                                   snapshot.child('Last Name').value.toString().substring(0,1
                                   ),
                                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                               ],
                               mainAxisAlignment: MainAxisAlignment.center,
                             ),
                           ),
                          backgroundColor: Colors.white12,
                             radius:55,

                           ),

                         SizedBox(
                           height: 10,
                         ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.child('First Name').value.toString(), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                            SizedBox(width: 4,),
                            Text(snapshot.child('Last Name').value.toString(), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          ],
                        ),
                         // SizedBox(height: 5,),
                         // Center(
                         //   child: Text(snapshot.child('Email').value.toString(),
                         //     style: TextStyle(color: Colors.white),),
                         // ),
                       ],
                     ),
                     // child: Center(
                     //   child: Text(snapshot.child('Name').value.toString(),
                     // style: TextStyle(color: Colors.white),),
                     // ),
                   );
                  },
               ),
             ),

              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                height: getheight(context)*0.35,
                width: getwidth(context),
                child: ListView(
                   children: [
                     SizedBox(
                       height: 30,
                     ),
                     ListTile(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>my_profile()));
                       },
                       leading: Icon(Icons.person,color: Colors.white,),
                       title: Text('My Profile',style: TextStyle(color: Colors.white),),
                       trailing: Icon(Icons.navigate_next,color: Colors.white,),
                       tileColor: Colors.white10,

                     ),
                     SizedBox(
                       height: getheight(context)*0.04,
                     ),
                     Text('Manage App Account information',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                     SizedBox(
                       height: 20,
                     ),
                     ListTile(
                       tileColor: Colors.white10,
                       leading: Icon(Icons.settings,color: Colors.white,),
                       title: Text('Settings',style: TextStyle(color: Colors.white),),
                       trailing: Icon(Icons.navigate_next,color: Colors.white,),
                     ),
                     SizedBox(height: 3,),
                     ListTile(
                       onTap: (){
                       },
                       tileColor: Colors.white10,
                       leading: Icon(Icons.feedback,color: Colors.white,),
                       title: Text('Give feedback',style: TextStyle(color: Colors.white),),
                       trailing: Icon(Icons.navigate_next,color: Colors.white,),
                     ),
                     SizedBox(height: 3,),
                     ListTile(
                       tileColor: Colors.white10,
                       leading: Icon(Icons.account_box_outlined,color: Colors.white,),
                       title: Text('About Us',style: TextStyle(color: Colors.white),),
                       trailing: Icon(Icons.navigate_next,color: Colors.white,),
                     ),
                   ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
