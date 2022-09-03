import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/source/content/content_remote_data_source_impl.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source_impl.dart';
import 'package:movie_curation/data/remote/source/youtube/youtube_remote_data_source_impl.dart';
import 'package:movie_curation/data/repository/channel/channel_repository.dart';
import 'package:movie_curation/data/repository/channel/channel_respository_impl.dart';
import 'package:movie_curation/data/repository/content/content_repository_impl.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository_impl.dart';
import 'package:movie_curation/data/repository/youtube/youtube_repository_impl.dart';

import '../../../utilities/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // Repository
    Get.lazyPut<TmdbRepository>(() => TmdbRepositoryImpl(Get.find()));
    Get.lazyPut<YoutubeRepository>(() => YoutubeRepositoryImpl(Get.find()));
    Get.lazyPut<ContentRepository>(
        () => ContentRepositoryImpl(Get.find(), Get.find()));
    Get.lazyPut<ChannelRepository>(() => ChannelRepositoryImpl());

    // Datasource
    Get.lazyPut<TmdbRemoteDataSource>(
        () => TmdbRemoteDataSourceImpl(Get.find()));
    Get.lazyPut<YoutubeRemoteDataSource>(
        () => YoutubeRemoteDataSourceImpl(Get.find()));
    Get.lazyPut<ContentRemoteDataSource>(
        () => ContentRemoteDataSourceImpl(Get.find()));

    // API
    Get.lazyPut(() => TmdbApi(Dio()));
    Get.lazyPut(() => YoutubeApi(Dio()));
    Get.lazyPut(() => ContentApi());
  }
}
