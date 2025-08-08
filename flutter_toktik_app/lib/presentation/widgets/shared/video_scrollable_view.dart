import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/domain/entities/video_post.dart';
import 'package:flutter_toktik_app/presentation/widgets/shared/video_buttons.dart';
import 'package:flutter_toktik_app/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videoPostList;

  const VideoScrollableView({super.key, required this.videoPostList});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videoPostList.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videoPostList[index];

        return Stack(
          children: [
            // Video player + Gradiente
            SizedBox.expand(child: FullScreenPlayer(
              videoUrl: videoPost.videoUrl,
              caption: videoPost.caption,
            )),
            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(videoPost: videoPost),
            ),
          ],
        );
      },
    );
  }
}
