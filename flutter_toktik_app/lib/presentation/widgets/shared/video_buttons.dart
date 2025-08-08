import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/config/helpers/human_formats.dart';
import 'package:flutter_toktik_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;

  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: videoPost.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red,
        ),
        SizedBox(height: 20),
        _CustomIconButton(
          value: videoPost.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        SizedBox(height: 20),
        SpinPerfect(
          duration: Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_fill_outlined,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(iconData, color: color, size: 30),
          onPressed: () {
            // Handle like action
          },
        ),
        if (value > 0)
          Text(HumanFormats.huamanReadableNumber(value.toDouble()).toString()),
      ],
    );
  }
}
