import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ItemVideos extends StatefulWidget {
  const ItemVideos({super.key, required this.path});

  final String path;

  @override
  State<ItemVideos> createState() => _ItemVideosState();
}

class _ItemVideosState extends State<ItemVideos> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemVideos oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const SizedBox()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
