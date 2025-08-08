import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/domain/entities/video_post.dart';
import 'package:flutter_toktik_app/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> videoPostList = videoPosts
    //     .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //     .toList();

    final videoPostList = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(videoPostList);
    initialLoading = false;
    notifyListeners();
  }
}
