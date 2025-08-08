import 'package:flutter/material.dart';
import 'package:flutter_toktik_app/config/theme/app_theme.dart';
import 'package:flutter_toktik_app/domain/repositories/video_post_repository.dart';
import 'package:flutter_toktik_app/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:flutter_toktik_app/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:flutter_toktik_app/presentation/providers/discover_provider.dart';
import 'package:flutter_toktik_app/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPostRepository videoPostRepository = VideoPostRepositoryImpl(
      videoPostDatasource:
          LocalVideoDatasourceImpl(), // Assuming you have a concrete implementation
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
