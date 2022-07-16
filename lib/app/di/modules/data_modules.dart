import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/network/api/youtube/youtube_api.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source_impl.dart';
import 'package:movie_curation/data/remote/source/youtube/youtube_remote_data_source.dart';
import 'package:movie_curation/data/remote/source/youtube/youtube_remote_data_source_impl.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_reponsitory_impl.dart';
import 'package:movie_curation/data/repository/youtube/youtube_repository.dart';
import 'package:movie_curation/data/repository/youtube/youtube_repository_impl.dart';

import '../../../utilities/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // Repository
    Get.lazyPut<TmdbRepository>(() => TmdbRepositoryImpl(Get.find()));
    Get.lazyPut<YoutubeRepository>(() => YoutubeRepositoryImpl(Get.find()));

    // Datasource
    Get.lazyPut<TmdbRemoteDataSource>(
        () => TmdbRemoteDataSourceImpl(Get.find()));
    Get.lazyPut<YoutubeRemoteDataSource>(
        () => YoutubeRemoteDataSourceImpl(Get.find()));

    // API
    Get.lazyPut(() => TmdbApi(Dio()));
    Get.lazyPut(() => YoutubeApi(Dio()));
  }
}
