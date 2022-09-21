import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  // VideoPlayerController controller =
  //     VideoPlayerController.asset('assets/video.mp4');

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.pause();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/sleeppad-video.mp4');
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(
                controller,
              ),
            ),
            // Container(
            //   //duration of video
            //   child: Text(
            //       "Total Duration: " + controller.value.duration.toString()),
            // ),
            VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                backgroundColor: Colors.redAccent,
                playedColor: Colors.green,
                bufferedColor: Colors.purple,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                      setState(() {});
                    },
                    icon: Icon(controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow)),
                IconButton(
                    onPressed: () {
                      controller.seekTo(Duration(seconds: 0));

                      setState(() {});
                    },
                    icon: Icon(Icons.stop))
              ],
            )
          ],
        ),
      ),
    );
  }
}
