import 'dart:async';
import 'package:alphafitness/ChestWorkout.dart';
import 'ChestWorkout.dart';
import 'set_height_and_width.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const legpress());

class legpress extends StatelessWidget {
  const legpress({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player Demo',
      home: legpressscreen(),
    );
  }
}

class legpressscreen extends StatefulWidget {
  const legpressscreen({super.key});

  @override
  State<legpressscreen> createState() => _legpressscreenState();
}

class _legpressscreenState extends State<legpressscreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://res.cloudinary.com/dg6kx8vbj/video/upload/c_fit,w_1419/v1684686718/vecteezy_leg-press-wide-high-stance-fitness-exercise-workout_20938653_365_locuii.mp4',

    );
    //_controller=VideoPlayerController.asset("assets/videos/incline_de.mp4");
    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: getheight(context)*0.1,
              child:  Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.03,top: getheight(context)*0.06),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(

                        'VIDEO',style: TextStyle(color: Colors.red,fontSize: 23,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('SHOWCASE',style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),),
            Container(
              margin: EdgeInsets.only(top: getheight(context)*0.03),
              height: getheight(context)*0.39,
              width: getwidth(context),
              child:
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,top: getheight(context)*0.03),
                  child: Text("Leg Press",
                    style: TextStyle(color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold),),
                ),
                Container(

                  margin: EdgeInsets.only(top: getheight(context)*0.03,right: 10),
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white10,
                    onPressed: () {
                      // Wrap the play or pause in a call to `setState`. This ensures the
                      // correct icon is shown.
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getheight(context)*0.04,
            ),
            Container(
              margin: EdgeInsets.only(left: getwidth(context)*0.05,right: getwidth(context)*0.05),
              height: 0.5,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(top:20,left: 20,right: 20),
              width: getwidth(context),
              child: Text(
'The leg press is a compound weight training exercise in which the individual pushes a weight or resistance away from them using their legs. The term leg press machine refers to the apparatus used to perform this exercise. The leg press can be used to evaluate an athletes overall lower body strength. ',

                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,

                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top:20,left: getwidth(context)*0.05,right: getwidth(context)*0.05),
              height: 0.5,
              color: Colors.white,
            ),
            SizedBox(
              height: getheight(context)*0.03,
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: getheight(context)*0.02),
              child: Text("Focus Area",
                style: TextStyle(color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: getheight(context)*0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(

                    children: [
                      Icon(Icons.circle_rounded,
                        color: Colors.red,
                        size: 17,),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text('Legs',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  width: getwidth(context)*0.3,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white10,
                  ),
                ),
                Container(
                  child: Row(

                    children: [
                      Icon(Icons.circle_rounded,
                        color: Colors.white38,
                        size: 15,),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text('Abs',style: TextStyle(color: Colors.white70,fontSize: 15,fontWeight: FontWeight.bold),))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  width: getwidth(context)*0.3,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white10,
                  ),
                ),
                Container(
                  child: Row(

                    children: [
                      Icon(Icons.circle_rounded,
                        color: Colors.white38,
                        size: 15,),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text('Glutes',style: TextStyle(color: Colors.white70,fontSize: 15,fontWeight: FontWeight.bold),))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  width: getwidth(context)*0.3,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white10,
                  ),
                ),
              ],
            ),
            SizedBox(height: getheight(context)*0.01,),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: getwidth(context),

              height: getheight(context)*0.52,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image:  AssetImage("assets/images/legsmuscle.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:
              Container(
                margin: EdgeInsets.only(left: getwidth(context)*0.1,right: getwidth(context)*0.1,top: 40,bottom: 50),
                width: getwidth(context),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Close',
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
      ),

    );
  }
}