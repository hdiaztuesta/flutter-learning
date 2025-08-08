import 'package:flutter_toktik_app/domain/datasources/video_post_datasource.dart';
import 'package:flutter_toktik_app/domain/entities/video_post.dart';
import 'package:flutter_toktik_app/infrastructure/models/local_video_model.dart';
import 'package:flutter_toktik_app/shared/data/local_video_post.dart';

class LocalVideoDatasourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) async {
    // Implementation for fetching favorite videos by user
    return [];
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> videoPostList = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    return videoPostList;
  }
}
