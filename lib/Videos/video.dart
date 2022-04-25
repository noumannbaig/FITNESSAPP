import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Videoplayer extends StatefulWidget {
  // final title;
  // final url;
  // @required this.title,@required this.url
   Videoplayer({ Key? key }) : super(key: key);
  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late VideoPlayerController _controller;
 late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
   _controller = VideoPlayerController.network(
     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
   );
      //  "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4"");
   //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
   _initializeVideoPlayerFuture = _controller.initialize();
   _controller.setLooping(true);
   _controller.setVolume(1.0);
   super.initState();
 }
 @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leg'),

      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}