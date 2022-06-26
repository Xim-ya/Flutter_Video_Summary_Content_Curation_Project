import 'package:dio/dio.dart';
import 'package:movie_curation/data/remote/network/api/tmdb/tmdb_api.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source.dart';
import 'package:movie_curation/data/remote/source/tmdb/tmdb_remote_data_source_impl.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_reponsitory_impl.dart';
import 'package:movie_curation/data/repository/tmdb/tmdb_repository.dart';

import '../../../utilities/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // Repository
    Get.lazyPut<TmdbRepository>(() => TmdbRepositoryImpl(Get.find()));

    // Datasource
    Get.lazyPut<TmdbRemoteDataSource>(
        () => TmdbRemoteDataSourceImpl(Get.find()));

    // API
    Get.lazyPut(() => TmdbApi(Dio()));
  }
}
