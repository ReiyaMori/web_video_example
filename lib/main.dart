import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:video_viewer/domain/bloc/controller.dart';
import 'package:video_viewer/video_viewer.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'web video example',
      debugShowCheckedModeBanner: false,
      home: WebVTTSubtitleVideoExample(),
    );
  }
}

// https://firebasestorage.googleapis.com/v0/b/cute-bio.appspot.com/o/videos%2F%E3%83%A1%E3%82%A4%E3%83%B3%E5%8B%95%E7%94%BB.mp4?alt=media&token=84e3f890-b229-4c0a-a014-89a185ce324b

class WebVTTSubtitleVideoExample extends StatelessWidget {
  const WebVTTSubtitleVideoExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VideoViewer(
      source: {
        "WebVTT Caption": VideoSource(
          video: VideoPlayerController.network(
            //This video has a problem when end
            "https://www.speechpad.com/proxy/get/marketing/samples/standard-captions-example.mp4",
          ),
          subtitle: {
            "English": VideoViewerSubtitle.network(
              "https://felipemurguia.com/assets/txt/WEBVTT_English.txt",
            ),
            "Spanish": VideoViewerSubtitle.network(
              "https://felipemurguia.com/assets/txt/WEBVTT_Spanish.txt",
            ),
          },
        )
      },
    );
  }
}