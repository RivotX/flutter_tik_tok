import 'package:flutter/material.dart';
import 'package:flutter_tik_tok/domain/entities/video_post.dart';
import 'package:flutter_tik_tok/presentation/widgets/shared/full_screen_player.dart';
import 'package:flutter_tik_tok/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            //video player + gradiente
            SizedBox.expand(child: Container()),
            FullScreenPlayer(caption: videoPost.caption, videoUrl: videoPost.videoUrl),
            //botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            )
          ],
        );
      },
    );
  }
}
