import 'package:alphafitness/UserRecordManager.dart';
import 'package:alphafitness/firebase_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'set_height_and_width.dart';
class my_profile extends StatefulWidget {
  const my_profile({Key? key}) : super(key: key);

  @override
  State<my_profile> createState() => _my_profileState();
}

class _my_profileState extends State<my_profile> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final firstinput=TextEditingController();
  final lastinput=TextEditingController();
   final heightController=TextEditingController();
  final weightController=TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('users');
  late String FirstName;
  late String LastName;
  late String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: Colors.black,
        child: Center(
          child: TextButton(
            onPressed: (){

             if(_auth.currentUser!=Null){
               _auth.currentUser?.delete();
               ref.child(UserRecords().Userid.toString()).remove();
               toast('Account deleted');
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>loginpage(usernameController: '')), (route) => false);
             }

              },
            child: Text('Delete Account',style: TextStyle(color: Colors.red,
                fontSize: 15,fontWeight: FontWeight.bold,   ),),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Profile', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: getheight(context),
        width: getwidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        width: getwidth(context) * 0.3,
                        height: getheight(context) * 0.15,

                        child: CircleAvatar(
                          child: FirebaseAnimatedList(
                            duration: Duration(seconds: 0),
                            query: ref.orderByChild('Email').equalTo(
                                _auth.currentUser?.email.toString()),
                            itemBuilder: (context, snapshot, animation, index) {
                              return Container(
                                height: getheight(context) * 0.15,

                                child: Row(
                                  children: [
                                    Text(
                                      snapshot
                                          .child('First Name')
                                          .value
                                          .toString()
                                          .substring(0, 1
                                      ),
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),),
                                    SizedBox(width: 1,),
                                    Text(
                                      snapshot
                                          .child('Last Name')
                                          .value
                                          .toString()
                                          .substring(0, 1
                                      ),
                                      style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),),

                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            },
                          ),
                          backgroundColor: Colors.white12,
                          radius: 35,

                        ),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        width: getwidth(context) * 0.5,
                        height: getheight(context) * 0.18,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Container(
                                width: getwidth(context) * 0.25,
                                height: 20,

                                child: FirebaseAnimatedList(
                                  query: ref.orderByChild('Email').equalTo(
                                      _auth.currentUser?.email.toString()),
                                  itemBuilder: (context, snapshot, animation,
                                      index) {
                                    return Container(
                                      width: getwidth(context) * 0.25,
                                      height: 20,
                                      child: Text(firstnameController.text= snapshot
                                          .child('First Name')
                                          .value
                                          .toString(),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 40,),
                              IconButton(onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        backgroundColor: Colors.white60,
                                        title: Text('First Name', style: TextStyle(
                                            color: Colors.white),),
                                        content: Container(
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.white),
                                            controller: firstinput,
                                            decoration: InputDecoration(
                                              hintText: firstnameController.text.toString(),
                                              hintStyle: TextStyle(color: Colors.white70,fontSize: 17),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2,
                                                  )
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15),
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1
                                                  )

                                              ),
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(onPressed: () {
                                            Navigator.pop(context);
                                          },
                                              child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.white70),)),
                                          TextButton(onPressed: () {
                                            ref.child(
                                                UserRecords().Userid.toString())
                                                .update({
                                              'First Name': firstinput
                                                  .text.toString(),
                                            })
                                                .then((value) {
                                              toast('Profile Updated');
                                            }).onError((error, stackTrace) {
                                              toast(error.toString());
                                            });
                                            Navigator.pop(context);
                                          },
                                              child: Text('Update',
                                                style: TextStyle(
                                                    color: Colors.red),)),
                                        ],
                                      );
                                    });
                              },
                                  icon: Icon(
                                    Icons.edit, color: Colors.white, size: 17,))
                            ],),
                            Row(children: [
                              Container(
                                width: getwidth(context) * 0.25,
                                height: 20,
                                child: FirebaseAnimatedList(
                                  query: ref.orderByChild('Email').equalTo(
                                      _auth.currentUser?.email.toString()),
                                  itemBuilder: (context, snapshot, animation,
                                      index) {
                                    return Container(
                                      width: getwidth(context) * 0.25,
                                      height: 20,
                                      child: Text(lastnameController.text= snapshot
                                          .child('Last Name')
                                          .value
                                          .toString(),
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 40,),
                              IconButton(onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        backgroundColor: Colors.white60,
                                        title: Text('Last Name', style: TextStyle(
                                            color: Colors.white),),
                                        content: Container(
                                          child: TextField(
                                            style: TextStyle(
                                                color: Colors.white),
                                            controller: lastinput,
                                            decoration: InputDecoration(
                                              hintText: lastnameController.text.toString(),
                                              hintStyle: TextStyle(color: Colors.white70,fontSize: 17),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15),
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 2,
                                                  )
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15),
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1
                                                  )

                                              ),
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(onPressed: () {
                                            Navigator.pop(context);
                                          },
                                              child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.white70),)),
                                          TextButton(onPressed: () {
                                            ref.child(
                                                UserRecords().Userid.toString())
                                                .update({
                                              'Last Name': lastinput
                                                  .text.toString(),
                                            })
                                                .then((value) {
                                              toast('Profile Updated');
                                            }).onError((error, stackTrace) {
                                              toast(error.toString());
                                            });
                                            Navigator.pop(context);
                                          },
                                              child: Text('Update',
                                                style: TextStyle(
                                                    color: Colors.red),)),
                                        ],
                                      );
                                    });
                              },
                                  icon: Icon(
                                    Icons.edit, color: Colors.white, size: 17,))
                            ],),
                          ],
                        ),
                      ),
                    ],
                  ),

                ), height: getheight(context) * 0.20,
                width: getwidth(context),
              ),
             SizedBox(height: getheight(context)*0.025,),
              Container( margin: EdgeInsets.only(left: getwidth(context)*0.05),
                  alignment: Alignment.centerLeft,
                  child: Text('Personal Information',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

              SizedBox(height: 15,),

              Container(
                height: 1,
                width: getwidth(context),
                color: Colors.white38,
              ),

             Container(
               margin: EdgeInsets.only(top:getheight(context)*0.01,left: getwidth(context)*0.02,right: getwidth(context)*0.02),
               decoration: BoxDecoration(

                 borderRadius: BorderRadius.circular(15)
               ),
               height: getheight(context)*0.08,
               width: getwidth(context),
               child: Center(
                 child:
              Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     // Container(
                     //   margin: EdgeInsets.only(left: getwidth(context)*0.05),
                     //     child: Icon(Icons.man,color: Colors.white,size: 25,)),
                     // SizedBox(width: getwidth(context)*0.15,),
                     Container(
                       margin: EdgeInsets.only(left: getwidth(context)*0.05),
                         child: Text('Height',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                     Spacer(),
                     InkWell(
                       onTap: (){

                         showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 backgroundColor: Colors.white60,
                                 title: Text('Height in cm', style: TextStyle(
                                     color: Colors.white),),
                                 content: Container(
                                   child: TextField(
                                     keyboardType: TextInputType.number,
                                     cursorColor: Colors.red,
                                     style: TextStyle(
                                         color: Colors.white),
                                     controller: heightController,
                                     decoration: InputDecoration(
                                       // hintText: lastnameController.text.toString(),
                                       // hintStyle: TextStyle(color: Colors.white70,fontSize: 17),
                                       focusedBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius
                                               .circular(15),
                                           borderSide: BorderSide(
                                             color: Colors.red,
                                             width: 2,
                                           )
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                           borderRadius: BorderRadius
                                               .circular(15),
                                           borderSide: BorderSide(
                                               color: Colors.white,
                                               width: 1
                                           )

                                       ),
                                     ),
                                   ),
                                 ),
                                 actions: [
                                   TextButton(onPressed: () {
                                     Navigator.pop(context);
                                   },
                                       child: Text('Cancel',
                                         style: TextStyle(
                                             color: Colors.white70),)),
                                   TextButton(onPressed: () {
                                     ref.child(
                                         UserRecords().Userid.toString())
                                         .update({
                                       'height':
                                           heightController.text.toString(),
                                     })
                                         .then((value) {
                                       toast('Height Updated');
                                     }).onError((error, stackTrace) {
                                       toast(error.toString());
                                     });
                                     Navigator.pop(context);
                                   },
                                       child: Text('Save',
                                         style: TextStyle(
                                             color: Colors.red),)),
                                 ],
                               );
                             });

                       },
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15),
                           color: Colors.white10,
                         ),
                         width: getwidth(context) * 0.18,
                         height: getheight(context) * 0.07,
                           child: FirebaseAnimatedList(
                             query: ref.orderByChild('Email').equalTo(
                                 _auth.currentUser?.email.toString()),
                             itemBuilder: (context, snapshot, animation,
                                 index) {
                               return Container(
                                 width: getwidth(context) * 0.18,
                                 height: getheight(context)*0.07,
                                 child: Center(
                                   child: Text(snapshot
                                       .child('height')
                                       .value
                                       .toString(),
                                     style: TextStyle(color: Colors.white,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20),),
                                 ),
                               );
                             },
                           ),
                         ),
                     ),




                     // Container(
                     //   decoration: BoxDecoration(
                     //     borderRadius: BorderRadius.circular(15),
                     //     color: Colors.white10,
                     //   ),
                     //   width: getwidth(context) * 0.18,
                     //   height: getheight(context) * 0.07,
                     //
                     //
                     //   child:
                     //   FirebaseAnimatedList(
                     //     query: ref.orderByChild('Email').equalTo(
                     //         _auth.currentUser?.email.toString()),
                     //     itemBuilder: (context, snapshot, animation,
                     //         index) {
                     //       return Container(
                     //         width: getwidth(context) * 0.17,
                     //         height: getheight(context)*0.07,
                     //         child: Center(
                     //           child: TextField(
                     //
                     //             cursorColor: Colors.red,
                     //             keyboardType: TextInputType.number,
                     //             style: TextStyle(
                     //                 color: Colors.white,
                     //                 fontSize: 20
                     //             ),
                     //             controller: heightController,
                     //             decoration: InputDecoration(
                     //               hintText: snapshot.child('height').value.toString(),
                     //                 hintStyle: TextStyle(color: Colors.white),
                     //                 enabledBorder: OutlineInputBorder(
                     //                     borderSide: BorderSide(
                     //                       color: Colors.white,
                     //                     )
                     //                 ),
                     //                 focusedBorder: OutlineInputBorder(
                     //                     borderSide: BorderSide(
                     //                       width: 2,
                     //                       color: Colors.red,
                     //                     )
                     //                 )
                     //             ),
                     //           ),
                     //         ),
                     //       );
                     //     },
                     //   ),margin: EdgeInsets.only(left: getwidth(context)*0.05),),
                 SizedBox(width: getwidth(context)*0.02,),
                     Container(
                         margin:EdgeInsets.only(right: getwidth(context)*0.05),child: Text('cm',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
                   ],
                 ),
    ),
               ),



    //           FirebaseAnimatedList(
    // query: ref1.orderByChild(UserRecords().Userid.toString()),
    // itemBuilder: (context, snapshot, animation,
    // index)
    // {
    //   snapshot.child('About').value.toString();
    //   return Container(
    //     margin: EdgeInsets.only(
    //         left: getwidth(context) * 0.05, right: getwidth(context) * 0.05),
    //     child: TextFormField(
    //       cursorColor: Colors.red,
    //       cursorHeight: 20,
    //       cursorWidth: 3,
    //       style: TextStyle(
    //           color: Colors.white
    //       ),
    //       validator: (value) {
    //         if (value!.isEmpty) {
    //           return 'Field is missing';
    //         }
    //       },
    //
    //       keyboardType: TextInputType.text,
    //       controller: aboutme,
    //       decoration: InputDecoration(
    //         suffixIcon: IconButton(
    //           onPressed: () {
    //             ref1.child(UserRecords().Userid.toString()).set({
    //               'About': aboutme.text.toString()
    //             }).then((value) {
    //
    //             }).onError((error, stackTrace) {
    //               toast(error.toString());
    //             });
    //           },
    //           icon: Icon(Icons.check, color: Colors.white,),
    //         ),
    //         hintText: "Type something about yourself",
    //         hintStyle: TextStyle(color: Colors.white38),
    //         contentPadding: EdgeInsets.only(top: 5),
    //         floatingLabelAlignment: FloatingLabelAlignment.start,
    //         label: Text(
    //           "About Me", style: TextStyle(color: Colors.white),
    //         ),
    //
    //         focusedBorder: UnderlineInputBorder(
    //             borderSide: BorderSide(color: Colors.white)
    //         ),
    //         // enabledBorder: OutlineInputBorder(
    //         //     borderRadius: BorderRadius.circular(15),
    //         //     borderSide: BorderSide(
    //         //         color: Colors.white,
    //         //         width: 1
    //         //     )
    //         //
    //         // ),
    //
    //       ),
    //     ),
    //   );
    // }
    //                     ),

             SizedBox(height: 10,),
              Container(
               height: 1,
               width: getwidth(context),
               color: Colors.white38,
             ),
              SizedBox(height: 10,),
              Container(
    margin: EdgeInsets.only(top:getheight(context)*0.01,left: getwidth(context)*0.02,right: getwidth(context)*0.02),
    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(15)
    ),
    height: getheight(context)*0.08,
    width: getwidth(context),
    child: Center(
    child:
          Row(

            children: [
              // Container(
              //   margin: EdgeInsets.only(left: getwidth(context)*0.05),
              //     child: Icon(Icons.man,color: Colors.white,size: 25,)),
              // SizedBox(width: getwidth(context)*0.15,),
              Container(
                  margin: EdgeInsets.only(left: getwidth(context)*0.05),
                  child: Text('Weight',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
              Spacer(),

              InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Colors.white60,
                          title: Text('Weight in Kg', style: TextStyle(
                              color: Colors.white),),
                          content: Container(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              style: TextStyle(
                                  color: Colors.white),
                              controller: weightController,
                              decoration: InputDecoration(
                                // hintText: lastnameController.text.toString(),
                                // hintStyle: TextStyle(color: Colors.white70,fontSize: 17),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius
                                        .circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius
                                        .circular(15),
                                    borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1
                                    )

                                ),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            },
                                child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.white70),)),
                            TextButton(onPressed: () {
                              ref.child(
                                  UserRecords().Userid.toString())
                                  .update({
                                'weight':
                                weightController.text.toString(),
                              })
                                  .then((value) {
                                toast('Weight Updated');
                              }).onError((error, stackTrace) {
                                toast(error.toString());
                              });
                              Navigator.pop(context);
                            },
                                child: Text('Save',
                                  style: TextStyle(
                                      color: Colors.red),)),
                          ],
                        );
                      });

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white10,
                  ),
                  width: getwidth(context) * 0.18,
                  height: getheight(context) * 0.07,
                  child: FirebaseAnimatedList(
                    query: ref.orderByChild('Email').equalTo(
                        _auth.currentUser?.email.toString()),
                    itemBuilder: (context, snapshot, animation,
                        index) {
                      return Container(
                        width: getwidth(context) * 0.18,
                        height: getheight(context)*0.07,
                        child: Center(
                          child: Text(snapshot
                              .child('weight')
                              .value
                              .toString(),
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(width: getwidth(context)*0.02,),
              Container(
                  margin:EdgeInsets.only(right: getwidth(context)*0.06),child: Text('Kg',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
            ],
          ),
    )
              ),

              SizedBox(height: 10,),
              Container(
                height: 1,
                width: getwidth(context),
                color: Colors.white38,
              ),
              SizedBox(height: 15,),
              Container( margin: EdgeInsets.only(left: getwidth(context)*0.05),
                  alignment: Alignment.centerLeft,
                  child: Text('Email Address ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              SizedBox(height: 15,),
    Container(
    margin: EdgeInsets.only(left: getwidth(context)*0.02,right: getwidth(context)*0.02),
    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(15)
    ),
    child: Center(
    child:
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Container(
    margin: EdgeInsets.only(left: getwidth(context)*0.05),
    child: Icon(Icons.email,color: Colors.white,size: 22,)),

      Container(
          margin:EdgeInsets.only(right: getwidth(context)*0.05),
        width: getwidth(context) * 0.7,
        height: getheight(context) * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

        ),

        child:
        FirebaseAnimatedList(
      query: ref.orderByChild('Email').equalTo(
          _auth.currentUser?.email.toString()),
      itemBuilder: (context, snapshot, animation,
          index) {
        return Container(
          width: getwidth(context) * 0.17,
          height: getheight(context)*0.07,
          child: Center(
            child: Text(snapshot
                .child('Email')
                .value
                .toString(),
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),),
          ),
        );
      },

    ),),
            ],
          ),
        ),
      ),
   ])))
      );
  }

}