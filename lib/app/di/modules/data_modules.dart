import 'package:dio/dio.dart';
import '../../../utilities/index.dart';

abstract class DataModules {
  DataModules._();

  static void dependencies() {
    // Repository
    Get.lazyPut<TmdbRepository>(() => TmdbRepositoryImpl(Get.find()));
    Get.lazyPut<YoutubeRepository>(() => YoutubeRepositoryImpl(Get.find()));
    Get.lazyPut<ContentRepository>(
        () => ContentRepositoryImpl(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<ChannelRepository>(() => ChannelRepositoryImpl(Get.find()));

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
    Get.lazyPut(() => ChannelApi());
  }
}
